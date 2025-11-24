import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    String? status,
    int? totalResults,
    @JsonKey(name: 'posts') T? data,
  }) = _BaseResponse<T>;

  const BaseResponse._();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) => _$BaseResponseFromJson<T>(json, fromJsonT);
}
