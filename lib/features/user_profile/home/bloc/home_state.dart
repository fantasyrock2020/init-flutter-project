part of 'home_bloc.dart';

@freezed
abstract class UserProfileHomeState with _$UserProfileHomeState {
  const factory UserProfileHomeState({
    @Default(false) bool success,
    @Default(0) int count,
  }) = _UserProfileHomeState;
}
