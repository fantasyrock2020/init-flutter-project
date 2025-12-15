import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart' show BaseException, ErrorException;

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

  Future<void> callDataService<Result>({
    required Future<Result> Function() action,
    void Function(Result value)? doOnSuccess,
    void Function(BaseException exception)? doOnError,
    void Function()? doOnEventCompleted,
    bool useOverlay = true,
    bool isShowLoading = true,
  }) async {
    try {
      if (!isClosed) {
        loadingEmitted(useOverlay: useOverlay, isShowLoading: isShowLoading);
      }

      final Result value = await action.call();

      if (!isClosed) {
        successEmitted();
      }

      doOnSuccess?.call(value);
    } on Object catch (error, stackTrace) {
      addError(error, stackTrace);
      final BaseException exception = ErrorException(message: error.toString());

      if (!isClosed) {
        errorEmitted(exception);
      }

      doOnError?.call(exception);
    } finally {
      doOnEventCompleted?.call();
    }
  }
}
