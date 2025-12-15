import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/data/network/exception/base_exception.dart'
    show BaseException;
import 'package:flutter/widgets.dart';

import '../routing/app_router.dart';
import 'base_status/status_cubit.dart';

class BaseBloc<E, S> extends BaseBlocDelegate<E, S> {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<E, S> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  final StatusCubit statusCubit = StatusCubit();

  BuildContext? get mContext => rootNavigatorKey.currentState?.context;

  Future<void> callDataService<T>({
    required Future<T> Function() action,
    void Function(T value)? doOnSuccess,
    void Function(BaseException error)? doOnError,
    void Function()? doOnEventCompleted,
    bool useOverlay = true,
    bool isShowLoading = true,
  }) => statusCubit.callDataService<T>(
    action: action,
    doOnSuccess: doOnSuccess,
    doOnError: doOnError,
    doOnEventCompleted: doOnEventCompleted,
    useOverlay: useOverlay,
    isShowLoading: isShowLoading,
  );
}
