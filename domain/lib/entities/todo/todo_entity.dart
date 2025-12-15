import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({@Default(0) int id, @Default('') String title}) =
      _TodoEntity;

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);
}
