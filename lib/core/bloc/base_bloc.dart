import 'dart:async';

import 'package:bloc/bloc.dart';

import '../data/network/exception/base_exception.dart';
import 'base_status/status_cubit.dart';

class BaseBloc<Event, State> extends BaseBlocDelegate<Event, State> {
  BaseBloc(super.initialState);
}

/// Delegate of BaseBloc
abstract class BaseBlocDelegate<E, S> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  final StatusCubit statusCubit = StatusCubit();

  Future<void> callDataService<T>({
    required Future<T> Function() action,
    FutureOr<void> Function()? doOnEventStart,
    FutureOr<void> Function(T value)? doOnSuccess,
    FutureOr<void> Function(BaseException error)? doOnError,
    FutureOr<void> Function()? doOnEventCompleted,
    bool autoHandleStatus = true,
    bool useOverlay = true,
    bool isShowLoading = true,
  }) => statusCubit.callDataService<T>(
    action: action,
    doOnEventStart: doOnEventStart,
    doOnSuccess: doOnSuccess,
    doOnError: doOnError,
    doOnEventCompleted: doOnEventCompleted,
    autoHandleStatus: autoHandleStatus,
    useOverlay: useOverlay,
    isShowLoading: isShowLoading,
  );
}
