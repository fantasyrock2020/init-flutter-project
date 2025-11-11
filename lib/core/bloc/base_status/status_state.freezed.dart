// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusState {

 bool get isInitialize; bool get useOverlay; bool get isLoading; bool get isError; bool get isSuccess; bool get isShowLoading; String? get errorMessage;
/// Create a copy of StatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusStateCopyWith<StatusState> get copyWith => _$StatusStateCopyWithImpl<StatusState>(this as StatusState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusState&&(identical(other.isInitialize, isInitialize) || other.isInitialize == isInitialize)&&(identical(other.useOverlay, useOverlay) || other.useOverlay == useOverlay)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowLoading, isShowLoading) || other.isShowLoading == isShowLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialize,useOverlay,isLoading,isError,isSuccess,isShowLoading,errorMessage);

@override
String toString() {
  return 'StatusState(isInitialize: $isInitialize, useOverlay: $useOverlay, isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, isShowLoading: $isShowLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $StatusStateCopyWith<$Res>  {
  factory $StatusStateCopyWith(StatusState value, $Res Function(StatusState) _then) = _$StatusStateCopyWithImpl;
@useResult
$Res call({
 bool isInitialize, bool useOverlay, bool isLoading, bool isError, bool isSuccess, bool isShowLoading, String? errorMessage
});




}
/// @nodoc
class _$StatusStateCopyWithImpl<$Res>
    implements $StatusStateCopyWith<$Res> {
  _$StatusStateCopyWithImpl(this._self, this._then);

  final StatusState _self;
  final $Res Function(StatusState) _then;

/// Create a copy of StatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInitialize = null,Object? useOverlay = null,Object? isLoading = null,Object? isError = null,Object? isSuccess = null,Object? isShowLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isInitialize: null == isInitialize ? _self.isInitialize : isInitialize // ignore: cast_nullable_to_non_nullable
as bool,useOverlay: null == useOverlay ? _self.useOverlay : useOverlay // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowLoading: null == isShowLoading ? _self.isShowLoading : isShowLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusState].
extension StatusStatePatterns on StatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusState value)  $default,){
final _that = this;
switch (_that) {
case _StatusState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusState value)?  $default,){
final _that = this;
switch (_that) {
case _StatusState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isInitialize,  bool useOverlay,  bool isLoading,  bool isError,  bool isSuccess,  bool isShowLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusState() when $default != null:
return $default(_that.isInitialize,_that.useOverlay,_that.isLoading,_that.isError,_that.isSuccess,_that.isShowLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isInitialize,  bool useOverlay,  bool isLoading,  bool isError,  bool isSuccess,  bool isShowLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _StatusState():
return $default(_that.isInitialize,_that.useOverlay,_that.isLoading,_that.isError,_that.isSuccess,_that.isShowLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isInitialize,  bool useOverlay,  bool isLoading,  bool isError,  bool isSuccess,  bool isShowLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _StatusState() when $default != null:
return $default(_that.isInitialize,_that.useOverlay,_that.isLoading,_that.isError,_that.isSuccess,_that.isShowLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _StatusState implements StatusState {
  const _StatusState({this.isInitialize = false, this.useOverlay = false, this.isLoading = false, this.isError = false, this.isSuccess = false, this.isShowLoading = true, this.errorMessage});
  

@override@JsonKey() final  bool isInitialize;
@override@JsonKey() final  bool useOverlay;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isShowLoading;
@override final  String? errorMessage;

/// Create a copy of StatusState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusStateCopyWith<_StatusState> get copyWith => __$StatusStateCopyWithImpl<_StatusState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusState&&(identical(other.isInitialize, isInitialize) || other.isInitialize == isInitialize)&&(identical(other.useOverlay, useOverlay) || other.useOverlay == useOverlay)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowLoading, isShowLoading) || other.isShowLoading == isShowLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialize,useOverlay,isLoading,isError,isSuccess,isShowLoading,errorMessage);

@override
String toString() {
  return 'StatusState(isInitialize: $isInitialize, useOverlay: $useOverlay, isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, isShowLoading: $isShowLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$StatusStateCopyWith<$Res> implements $StatusStateCopyWith<$Res> {
  factory _$StatusStateCopyWith(_StatusState value, $Res Function(_StatusState) _then) = __$StatusStateCopyWithImpl;
@override @useResult
$Res call({
 bool isInitialize, bool useOverlay, bool isLoading, bool isError, bool isSuccess, bool isShowLoading, String? errorMessage
});




}
/// @nodoc
class __$StatusStateCopyWithImpl<$Res>
    implements _$StatusStateCopyWith<$Res> {
  __$StatusStateCopyWithImpl(this._self, this._then);

  final _StatusState _self;
  final $Res Function(_StatusState) _then;

/// Create a copy of StatusState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInitialize = null,Object? useOverlay = null,Object? isLoading = null,Object? isError = null,Object? isSuccess = null,Object? isShowLoading = null,Object? errorMessage = freezed,}) {
  return _then(_StatusState(
isInitialize: null == isInitialize ? _self.isInitialize : isInitialize // ignore: cast_nullable_to_non_nullable
as bool,useOverlay: null == useOverlay ? _self.useOverlay : useOverlay // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowLoading: null == isShowLoading ? _self.isShowLoading : isShowLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
