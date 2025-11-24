// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => _TodoModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
);

Map<String, dynamic> _$TodoModelToJson(_TodoModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};
