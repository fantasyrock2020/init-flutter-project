import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    String? status,
    int? totalResults,
    List<T>? articles,
  }) = _BaseResponse<T>;

  const BaseResponse._();

  factory BaseResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson<T>(json, fromJsonT);
}
