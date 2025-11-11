import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/bloc/base_bloc.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeHomeBloc extends BaseBloc<HomeHomeEvent, HomeHomeState> {
  HomeHomeBloc() : super(const HomeHomeState()) {
    on<_Started>(_onStarted);
  }

  FutureOr<void> _onStarted(_Started event, Emitter<HomeHomeState> emit) {
    // TODO: Initialize state here
  }
}
