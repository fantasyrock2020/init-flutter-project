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
mixin _$UserProfileHomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileHomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileHomeEvent()';
}


}

/// @nodoc
class $UserProfileHomeEventCopyWith<$Res>  {
$UserProfileHomeEventCopyWith(UserProfileHomeEvent _, $Res Function(UserProfileHomeEvent) __);
}


/// Adds pattern-matching-related methods to [UserProfileHomeEvent].
extension UserProfileHomeEventPatterns on UserProfileHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Increase value)?  increase,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Increase() when increase != null:
return increase(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Increase value)  increase,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Increase():
return increase(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Increase value)?  increase,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Increase() when increase != null:
return increase(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  increase,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Increase() when increase != null:
return increase();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  increase,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Increase():
return increase();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  increase,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Increase() when increase != null:
return increase();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UserProfileHomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileHomeEvent.started()';
}


}




/// @nodoc


class _Increase implements UserProfileHomeEvent {
  const _Increase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Increase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileHomeEvent.increase()';
}


}




/// @nodoc
mixin _$UserProfileHomeState {

 bool get success; int get count;
/// Create a copy of UserProfileHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileHomeStateCopyWith<UserProfileHomeState> get copyWith => _$UserProfileHomeStateCopyWithImpl<UserProfileHomeState>(this as UserProfileHomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileHomeState&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,success,count);

@override
String toString() {
  return 'UserProfileHomeState(success: $success, count: $count)';
}


}

/// @nodoc
abstract mixin class $UserProfileHomeStateCopyWith<$Res>  {
  factory $UserProfileHomeStateCopyWith(UserProfileHomeState value, $Res Function(UserProfileHomeState) _then) = _$UserProfileHomeStateCopyWithImpl;
@useResult
$Res call({
 bool success, int count
});




}
/// @nodoc
class _$UserProfileHomeStateCopyWithImpl<$Res>
    implements $UserProfileHomeStateCopyWith<$Res> {
  _$UserProfileHomeStateCopyWithImpl(this._self, this._then);

  final UserProfileHomeState _self;
  final $Res Function(UserProfileHomeState) _then;

/// Create a copy of UserProfileHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? count = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileHomeState].
extension UserProfileHomeStatePatterns on UserProfileHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileHomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileHomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileHomeState value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileHomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileHomeState value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileHomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileHomeState() when $default != null:
return $default(_that.success,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int count)  $default,) {final _that = this;
switch (_that) {
case _UserProfileHomeState():
return $default(_that.success,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int count)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileHomeState() when $default != null:
return $default(_that.success,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileHomeState implements UserProfileHomeState {
  const _UserProfileHomeState({this.success = false, this.count = 0});
  

@override@JsonKey() final  bool success;
@override@JsonKey() final  int count;

/// Create a copy of UserProfileHomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileHomeStateCopyWith<_UserProfileHomeState> get copyWith => __$UserProfileHomeStateCopyWithImpl<_UserProfileHomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileHomeState&&(identical(other.success, success) || other.success == success)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,success,count);

@override
String toString() {
  return 'UserProfileHomeState(success: $success, count: $count)';
}


}

/// @nodoc
abstract mixin class _$UserProfileHomeStateCopyWith<$Res> implements $UserProfileHomeStateCopyWith<$Res> {
  factory _$UserProfileHomeStateCopyWith(_UserProfileHomeState value, $Res Function(_UserProfileHomeState) _then) = __$UserProfileHomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool success, int count
});




}
/// @nodoc
class __$UserProfileHomeStateCopyWithImpl<$Res>
    implements _$UserProfileHomeStateCopyWith<$Res> {
  __$UserProfileHomeStateCopyWithImpl(this._self, this._then);

  final _UserProfileHomeState _self;
  final $Res Function(_UserProfileHomeState) _then;

/// Create a copy of UserProfileHomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? count = null,}) {
  return _then(_UserProfileHomeState(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
