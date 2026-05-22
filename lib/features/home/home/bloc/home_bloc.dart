import 'dart:async';

import 'package:core/core.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeHomeBloc extends BaseBloc<HomeHomeEvent, HomeHomeState> {
  HomeHomeBloc() : super(const HomeHomeState()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter<HomeHomeState> emit) async {}
}
