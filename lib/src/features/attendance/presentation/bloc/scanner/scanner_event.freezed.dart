// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerEvent()';
}


}

/// @nodoc
class $ScannerEventCopyWith<$Res>  {
$ScannerEventCopyWith(ScannerEvent _, $Res Function(ScannerEvent) __);
}


/// Adds pattern-matching-related methods to [ScannerEvent].
extension ScannerEventPatterns on ScannerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _QrDetected value)?  qrDetected,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrDetected() when qrDetected != null:
return qrDetected(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _QrDetected value)  qrDetected,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _QrDetected():
return qrDetected(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _QrDetected value)?  qrDetected,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _QrDetected() when qrDetected != null:
return qrDetected(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String qrValue)?  qrDetected,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrDetected() when qrDetected != null:
return qrDetected(_that.qrValue);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String qrValue)  qrDetected,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _QrDetected():
return qrDetected(_that.qrValue);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String qrValue)?  qrDetected,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _QrDetected() when qrDetected != null:
return qrDetected(_that.qrValue);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _QrDetected implements ScannerEvent {
  const _QrDetected(this.qrValue);
  

 final  String qrValue;

/// Create a copy of ScannerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrDetectedCopyWith<_QrDetected> get copyWith => __$QrDetectedCopyWithImpl<_QrDetected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrDetected&&(identical(other.qrValue, qrValue) || other.qrValue == qrValue));
}


@override
int get hashCode => Object.hash(runtimeType,qrValue);

@override
String toString() {
  return 'ScannerEvent.qrDetected(qrValue: $qrValue)';
}


}

/// @nodoc
abstract mixin class _$QrDetectedCopyWith<$Res> implements $ScannerEventCopyWith<$Res> {
  factory _$QrDetectedCopyWith(_QrDetected value, $Res Function(_QrDetected) _then) = __$QrDetectedCopyWithImpl;
@useResult
$Res call({
 String qrValue
});




}
/// @nodoc
class __$QrDetectedCopyWithImpl<$Res>
    implements _$QrDetectedCopyWith<$Res> {
  __$QrDetectedCopyWithImpl(this._self, this._then);

  final _QrDetected _self;
  final $Res Function(_QrDetected) _then;

/// Create a copy of ScannerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? qrValue = null,}) {
  return _then(_QrDetected(
null == qrValue ? _self.qrValue : qrValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements ScannerEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScannerEvent.reset()';
}


}




// dart format on
