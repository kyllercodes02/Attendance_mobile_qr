// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_scan_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceScanResult {

 bool get success; String get message; ScannedStudent? get student; ScannedAttendance? get attendance;
/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceScanResultCopyWith<AttendanceScanResult> get copyWith => _$AttendanceScanResultCopyWithImpl<AttendanceScanResult>(this as AttendanceScanResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceScanResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.student, student) || other.student == student)&&(identical(other.attendance, attendance) || other.attendance == attendance));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,student,attendance);

@override
String toString() {
  return 'AttendanceScanResult(success: $success, message: $message, student: $student, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $AttendanceScanResultCopyWith<$Res>  {
  factory $AttendanceScanResultCopyWith(AttendanceScanResult value, $Res Function(AttendanceScanResult) _then) = _$AttendanceScanResultCopyWithImpl;
@useResult
$Res call({
 bool success, String message, ScannedStudent? student, ScannedAttendance? attendance
});


$ScannedStudentCopyWith<$Res>? get student;$ScannedAttendanceCopyWith<$Res>? get attendance;

}
/// @nodoc
class _$AttendanceScanResultCopyWithImpl<$Res>
    implements $AttendanceScanResultCopyWith<$Res> {
  _$AttendanceScanResultCopyWithImpl(this._self, this._then);

  final AttendanceScanResult _self;
  final $Res Function(AttendanceScanResult) _then;

/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? student = freezed,Object? attendance = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as ScannedStudent?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as ScannedAttendance?,
  ));
}
/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannedStudentCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $ScannedStudentCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannedAttendanceCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
    return null;
  }

  return $ScannedAttendanceCopyWith<$Res>(_self.attendance!, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceScanResult].
extension AttendanceScanResultPatterns on AttendanceScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceScanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceScanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceScanResult value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceScanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceScanResult value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceScanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  ScannedStudent? student,  ScannedAttendance? attendance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceScanResult() when $default != null:
return $default(_that.success,_that.message,_that.student,_that.attendance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  ScannedStudent? student,  ScannedAttendance? attendance)  $default,) {final _that = this;
switch (_that) {
case _AttendanceScanResult():
return $default(_that.success,_that.message,_that.student,_that.attendance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  ScannedStudent? student,  ScannedAttendance? attendance)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceScanResult() when $default != null:
return $default(_that.success,_that.message,_that.student,_that.attendance);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceScanResult implements AttendanceScanResult {
  const _AttendanceScanResult({required this.success, required this.message, this.student, this.attendance});
  

@override final  bool success;
@override final  String message;
@override final  ScannedStudent? student;
@override final  ScannedAttendance? attendance;

/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceScanResultCopyWith<_AttendanceScanResult> get copyWith => __$AttendanceScanResultCopyWithImpl<_AttendanceScanResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceScanResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.student, student) || other.student == student)&&(identical(other.attendance, attendance) || other.attendance == attendance));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,student,attendance);

@override
String toString() {
  return 'AttendanceScanResult(success: $success, message: $message, student: $student, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class _$AttendanceScanResultCopyWith<$Res> implements $AttendanceScanResultCopyWith<$Res> {
  factory _$AttendanceScanResultCopyWith(_AttendanceScanResult value, $Res Function(_AttendanceScanResult) _then) = __$AttendanceScanResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, ScannedStudent? student, ScannedAttendance? attendance
});


@override $ScannedStudentCopyWith<$Res>? get student;@override $ScannedAttendanceCopyWith<$Res>? get attendance;

}
/// @nodoc
class __$AttendanceScanResultCopyWithImpl<$Res>
    implements _$AttendanceScanResultCopyWith<$Res> {
  __$AttendanceScanResultCopyWithImpl(this._self, this._then);

  final _AttendanceScanResult _self;
  final $Res Function(_AttendanceScanResult) _then;

/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? student = freezed,Object? attendance = freezed,}) {
  return _then(_AttendanceScanResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as ScannedStudent?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as ScannedAttendance?,
  ));
}

/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannedStudentCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $ScannedStudentCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of AttendanceScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScannedAttendanceCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
    return null;
  }

  return $ScannedAttendanceCopyWith<$Res>(_self.attendance!, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}

/// @nodoc
mixin _$ScannedStudent {

 int get id; String get name; String get studentNo;
/// Create a copy of ScannedStudent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedStudentCopyWith<ScannedStudent> get copyWith => _$ScannedStudentCopyWithImpl<ScannedStudent>(this as ScannedStudent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentNo, studentNo) || other.studentNo == studentNo));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,studentNo);

@override
String toString() {
  return 'ScannedStudent(id: $id, name: $name, studentNo: $studentNo)';
}


}

/// @nodoc
abstract mixin class $ScannedStudentCopyWith<$Res>  {
  factory $ScannedStudentCopyWith(ScannedStudent value, $Res Function(ScannedStudent) _then) = _$ScannedStudentCopyWithImpl;
@useResult
$Res call({
 int id, String name, String studentNo
});




}
/// @nodoc
class _$ScannedStudentCopyWithImpl<$Res>
    implements $ScannedStudentCopyWith<$Res> {
  _$ScannedStudentCopyWithImpl(this._self, this._then);

  final ScannedStudent _self;
  final $Res Function(ScannedStudent) _then;

/// Create a copy of ScannedStudent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? studentNo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,studentNo: null == studentNo ? _self.studentNo : studentNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedStudent].
extension ScannedStudentPatterns on ScannedStudent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedStudent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedStudent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedStudent value)  $default,){
final _that = this;
switch (_that) {
case _ScannedStudent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedStudent value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedStudent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String studentNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedStudent() when $default != null:
return $default(_that.id,_that.name,_that.studentNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String studentNo)  $default,) {final _that = this;
switch (_that) {
case _ScannedStudent():
return $default(_that.id,_that.name,_that.studentNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String studentNo)?  $default,) {final _that = this;
switch (_that) {
case _ScannedStudent() when $default != null:
return $default(_that.id,_that.name,_that.studentNo);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedStudent implements ScannedStudent {
  const _ScannedStudent({required this.id, required this.name, required this.studentNo});
  

@override final  int id;
@override final  String name;
@override final  String studentNo;

/// Create a copy of ScannedStudent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedStudentCopyWith<_ScannedStudent> get copyWith => __$ScannedStudentCopyWithImpl<_ScannedStudent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedStudent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentNo, studentNo) || other.studentNo == studentNo));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,studentNo);

@override
String toString() {
  return 'ScannedStudent(id: $id, name: $name, studentNo: $studentNo)';
}


}

/// @nodoc
abstract mixin class _$ScannedStudentCopyWith<$Res> implements $ScannedStudentCopyWith<$Res> {
  factory _$ScannedStudentCopyWith(_ScannedStudent value, $Res Function(_ScannedStudent) _then) = __$ScannedStudentCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String studentNo
});




}
/// @nodoc
class __$ScannedStudentCopyWithImpl<$Res>
    implements _$ScannedStudentCopyWith<$Res> {
  __$ScannedStudentCopyWithImpl(this._self, this._then);

  final _ScannedStudent _self;
  final $Res Function(_ScannedStudent) _then;

/// Create a copy of ScannedStudent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? studentNo = null,}) {
  return _then(_ScannedStudent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,studentNo: null == studentNo ? _self.studentNo : studentNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ScannedAttendance {

 String get type; DateTime? get time;
/// Create a copy of ScannedAttendance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedAttendanceCopyWith<ScannedAttendance> get copyWith => _$ScannedAttendanceCopyWithImpl<ScannedAttendance>(this as ScannedAttendance, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedAttendance&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,type,time);

@override
String toString() {
  return 'ScannedAttendance(type: $type, time: $time)';
}


}

/// @nodoc
abstract mixin class $ScannedAttendanceCopyWith<$Res>  {
  factory $ScannedAttendanceCopyWith(ScannedAttendance value, $Res Function(ScannedAttendance) _then) = _$ScannedAttendanceCopyWithImpl;
@useResult
$Res call({
 String type, DateTime? time
});




}
/// @nodoc
class _$ScannedAttendanceCopyWithImpl<$Res>
    implements $ScannedAttendanceCopyWith<$Res> {
  _$ScannedAttendanceCopyWithImpl(this._self, this._then);

  final ScannedAttendance _self;
  final $Res Function(ScannedAttendance) _then;

/// Create a copy of ScannedAttendance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? time = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedAttendance].
extension ScannedAttendancePatterns on ScannedAttendance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedAttendance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedAttendance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedAttendance value)  $default,){
final _that = this;
switch (_that) {
case _ScannedAttendance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedAttendance value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedAttendance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  DateTime? time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedAttendance() when $default != null:
return $default(_that.type,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  DateTime? time)  $default,) {final _that = this;
switch (_that) {
case _ScannedAttendance():
return $default(_that.type,_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  DateTime? time)?  $default,) {final _that = this;
switch (_that) {
case _ScannedAttendance() when $default != null:
return $default(_that.type,_that.time);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedAttendance implements ScannedAttendance {
  const _ScannedAttendance({required this.type, required this.time});
  

@override final  String type;
@override final  DateTime? time;

/// Create a copy of ScannedAttendance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedAttendanceCopyWith<_ScannedAttendance> get copyWith => __$ScannedAttendanceCopyWithImpl<_ScannedAttendance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedAttendance&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,type,time);

@override
String toString() {
  return 'ScannedAttendance(type: $type, time: $time)';
}


}

/// @nodoc
abstract mixin class _$ScannedAttendanceCopyWith<$Res> implements $ScannedAttendanceCopyWith<$Res> {
  factory _$ScannedAttendanceCopyWith(_ScannedAttendance value, $Res Function(_ScannedAttendance) _then) = __$ScannedAttendanceCopyWithImpl;
@override @useResult
$Res call({
 String type, DateTime? time
});




}
/// @nodoc
class __$ScannedAttendanceCopyWithImpl<$Res>
    implements _$ScannedAttendanceCopyWith<$Res> {
  __$ScannedAttendanceCopyWithImpl(this._self, this._then);

  final _ScannedAttendance _self;
  final $Res Function(_ScannedAttendance) _then;

/// Create a copy of ScannedAttendance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? time = freezed,}) {
  return _then(_ScannedAttendance(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
