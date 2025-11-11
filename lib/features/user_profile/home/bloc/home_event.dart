part of 'home_bloc.dart';

@freezed
abstract class UserProfileHomeEvent with _$UserProfileHomeEvent {
  const factory UserProfileHomeEvent.started() = _Started;
  const factory UserProfileHomeEvent.increase() = _Increase;
}
