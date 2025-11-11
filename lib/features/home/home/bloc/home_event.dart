part of 'home_bloc.dart';

@freezed
abstract class HomeHomeEvent with _$HomeHomeEvent {
  const factory HomeHomeEvent.started() = _Started;
}
