import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class UserProfileHomeBloc
    extends BaseBloc<UserProfileHomeEvent, UserProfileHomeState> {
  UserProfileHomeBloc() : super(const UserProfileHomeState()) {
    on<_Started>(_onStarted);
    on<_Increase>(_onIncrease);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<UserProfileHomeState> emit,
  ) async {
    // TODO: Initialize state here
  }

  Future<void> _onIncrease(
    _Increase event,
    Emitter<UserProfileHomeState> emit,
  ) async {
    emit(state.copyWith(count: state.count + 1));
  }
}
