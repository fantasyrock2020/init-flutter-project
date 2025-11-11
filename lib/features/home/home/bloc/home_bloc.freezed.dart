// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeHomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeHomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeHomeEvent()';
}


}

/// @nodoc
class $HomeHomeEventCopyWith<$Res>  {
$HomeHomeEventCopyWith(HomeHomeEvent _, $Res Function(HomeHomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeHomeEvent].
extension HomeHomeEventPatterns on HomeHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements HomeHomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeHomeEvent.started()';
}


}




/// @nodoc
mixin _$HomeHomeState {

 bool get success;
/// Create a copy of HomeHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeHomeStateCopyWith<HomeHomeState> get copyWith => _$HomeHomeStateCopyWithImpl<HomeHomeState>(this as HomeHomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeHomeState&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'HomeHomeState(success: $success)';
}


}

/// @nodoc
abstract mixin class $HomeHomeStateCopyWith<$Res>  {
  factory $HomeHomeStateCopyWith(HomeHomeState value, $Res Function(HomeHomeState) _then) = _$HomeHomeStateCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$HomeHomeStateCopyWithImpl<$Res>
    implements $HomeHomeStateCopyWith<$Res> {
  _$HomeHomeStateCopyWithImpl(this._self, this._then);

  final HomeHomeState _self;
  final $Res Function(HomeHomeState) _then;

/// Create a copy of HomeHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeHomeState].
extension HomeHomeStatePatterns on HomeHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeHomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeHomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeHomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeHomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeHomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeHomeState() when $default != null:
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
case _HomeHomeState() when $default != null:
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
case _HomeHomeState():
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
case _HomeHomeState() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc


class _HomeHomeState implements HomeHomeState {
  const _HomeHomeState({this.success = false});
  

@override@JsonKey() final  bool success;

/// Create a copy of HomeHomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeHomeStateCopyWith<_HomeHomeState> get copyWith => __$HomeHomeStateCopyWithImpl<_HomeHomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeHomeState&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'HomeHomeState(success: $success)';
}


}

/// @nodoc
abstract mixin class _$HomeHomeStateCopyWith<$Res> implements $HomeHomeStateCopyWith<$Res> {
  factory _$HomeHomeStateCopyWith(_HomeHomeState value, $Res Function(_HomeHomeState) _then) = __$HomeHomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$HomeHomeStateCopyWithImpl<$Res>
    implements _$HomeHomeStateCopyWith<$Res> {
  __$HomeHomeStateCopyWithImpl(this._self, this._then);

  final _HomeHomeState _self;
  final $Res Function(_HomeHomeState) _then;

/// Create a copy of HomeHomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_HomeHomeState(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
