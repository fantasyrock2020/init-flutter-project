// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoTodoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoTodoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent()';
}


}

/// @nodoc
class $TodoTodoEventCopyWith<$Res>  {
$TodoTodoEventCopyWith(TodoTodoEvent _, $Res Function(TodoTodoEvent) __);
}


/// Adds pattern-matching-related methods to [TodoTodoEvent].
extension TodoTodoEventPatterns on TodoTodoEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetAll value)?  getAll,TResult Function( _Insert value)?  insert,TResult Function( _Update value)?  update,TResult Function( _Delete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAll() when getAll != null:
return getAll(_that);case _Insert() when insert != null:
return insert(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetAll value)  getAll,required TResult Function( _Insert value)  insert,required TResult Function( _Update value)  update,required TResult Function( _Delete value)  delete,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetAll():
return getAll(_that);case _Insert():
return insert(_that);case _Update():
return update(_that);case _Delete():
return delete(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetAll value)?  getAll,TResult? Function( _Insert value)?  insert,TResult? Function( _Update value)?  update,TResult? Function( _Delete value)?  delete,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetAll() when getAll != null:
return getAll(_that);case _Insert() when insert != null:
return insert(_that);case _Update() when update != null:
return update(_that);case _Delete() when delete != null:
return delete(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getAll,TResult Function()?  insert,TResult Function()?  update,TResult Function()?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAll() when getAll != null:
return getAll();case _Insert() when insert != null:
return insert();case _Update() when update != null:
return update();case _Delete() when delete != null:
return delete();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getAll,required TResult Function()  insert,required TResult Function()  update,required TResult Function()  delete,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetAll():
return getAll();case _Insert():
return insert();case _Update():
return update();case _Delete():
return delete();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getAll,TResult? Function()?  insert,TResult? Function()?  update,TResult? Function()?  delete,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetAll() when getAll != null:
return getAll();case _Insert() when insert != null:
return insert();case _Update() when update != null:
return update();case _Delete() when delete != null:
return delete();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TodoTodoEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent.started()';
}


}




/// @nodoc


class _GetAll implements TodoTodoEvent {
  const _GetAll();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAll);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent.getAll()';
}


}




/// @nodoc


class _Insert implements TodoTodoEvent {
  const _Insert();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Insert);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent.insert()';
}


}




/// @nodoc


class _Update implements TodoTodoEvent {
  const _Update();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent.update()';
}


}




/// @nodoc


class _Delete implements TodoTodoEvent {
  const _Delete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoTodoEvent.delete()';
}


}




/// @nodoc
mixin _$TodoTodoState {

 bool get success;
/// Create a copy of TodoTodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoTodoStateCopyWith<TodoTodoState> get copyWith => _$TodoTodoStateCopyWithImpl<TodoTodoState>(this as TodoTodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoTodoState&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'TodoTodoState(success: $success)';
}


}

/// @nodoc
abstract mixin class $TodoTodoStateCopyWith<$Res>  {
  factory $TodoTodoStateCopyWith(TodoTodoState value, $Res Function(TodoTodoState) _then) = _$TodoTodoStateCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$TodoTodoStateCopyWithImpl<$Res>
    implements $TodoTodoStateCopyWith<$Res> {
  _$TodoTodoStateCopyWithImpl(this._self, this._then);

  final TodoTodoState _self;
  final $Res Function(TodoTodoState) _then;

/// Create a copy of TodoTodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoTodoState].
extension TodoTodoStatePatterns on TodoTodoState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoTodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoTodoState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoTodoState value)  $default,){
final _that = this;
switch (_that) {
case _TodoTodoState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoTodoState value)?  $default,){
final _that = this;
switch (_that) {
case _TodoTodoState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoTodoState() when $default != null:
return $default(_that.success);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _TodoTodoState():
return $default(_that.success);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _TodoTodoState() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc


class _TodoTodoState implements TodoTodoState {
  const _TodoTodoState({this.success = false});
  

@override@JsonKey() final  bool success;

/// Create a copy of TodoTodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoTodoStateCopyWith<_TodoTodoState> get copyWith => __$TodoTodoStateCopyWithImpl<_TodoTodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoTodoState&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'TodoTodoState(success: $success)';
}


}

/// @nodoc
abstract mixin class _$TodoTodoStateCopyWith<$Res> implements $TodoTodoStateCopyWith<$Res> {
  factory _$TodoTodoStateCopyWith(_TodoTodoState value, $Res Function(_TodoTodoState) _then) = __$TodoTodoStateCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$TodoTodoStateCopyWithImpl<$Res>
    implements _$TodoTodoStateCopyWith<$Res> {
  __$TodoTodoStateCopyWithImpl(this._self, this._then);

  final _TodoTodoState _self;
  final $Res Function(_TodoTodoState) _then;

/// Create a copy of TodoTodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_TodoTodoState(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
