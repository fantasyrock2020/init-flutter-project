import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_state.freezed.dart';

@freezed
abstract class StatusState with _$StatusState {
  const factory StatusState({
    @Default(false) bool useOverlay,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    @Default(true) bool isShowLoading,
    String? errorMessage,
  }) = _StatusState;
}
