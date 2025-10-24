import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/network/exception/exception.dart';
import 'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(const StatusState());

  void loadingEmitted({bool isShowLoading = true, bool useOverlay = true}) =>
      emit(
        state.copyWith(
          isLoading: true,
          isShowLoading: isShowLoading,
          useOverlay: useOverlay,
          isError: false,
          errorMessage: null,
          isSuccess: false,
        ),
      );

  void errorEmitted(BaseException error) => emit(
    state.copyWith(
      isError: true,
      errorMessage: error.message,
      isLoading: false,
      isSuccess: false,
    ),
  );

  void successEmitted() => emit(
    state.copyWith(
      isLoading: false,
      isError: false,
      errorMessage: null,
      isSuccess: true,
    ),
  );

  void initialEmitted() =>
      emit(state.copyWith(isInitialize: true, isSuccess: false));

  /// Execute function safe
  Future<void> callDataService<Result>({
    required Future<Result> Function() action,
    FutureOr<void> Function()? doOnEventStart,
    FutureOr<void> Function(Result value)? doOnSuccess,
    FutureOr<void> Function(BaseException exception)? doOnError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool autoHandleStatus = true,
    bool useOverlay = true,
    bool isShowLoading = true,
  }) async {
    try {
      if (autoHandleStatus && !isClosed && doOnEventStart != null) {
        initialEmitted();
      }

      await doOnEventStart?.call();

      if (autoHandleStatus && !isClosed) {
        loadingEmitted(useOverlay: useOverlay, isShowLoading: isShowLoading);
      }

      final Result value = await action.call();

      if (autoHandleStatus && !isClosed) {
        successEmitted();
      }

      await doOnSuccess?.call(value);
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      final BaseException exception = ErrorException(message: error.toString());

      if (autoHandleStatus && !isClosed) {
        errorEmitted(exception);
      }

      await doOnError?.call(exception);
    } finally {
      await doOnEventCompleted?.call();
    }
  }
}
