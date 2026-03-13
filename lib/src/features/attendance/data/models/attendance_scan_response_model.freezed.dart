// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_scan_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceScanResponseModel {

 bool get success; String get message; StudentResponseModel? get student; AttendanceResponseModel? get attendance;
/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceScanResponseModelCopyWith<AttendanceScanResponseModel> get copyWith => _$AttendanceScanResponseModelCopyWithImpl<AttendanceScanResponseModel>(this as AttendanceScanResponseModel, _$identity);

  /// Serializes this AttendanceScanResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceScanResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.student, student) || other.student == student)&&(identical(other.attendance, attendance) || other.attendance == attendance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,student,attendance);

@override
String toString() {
  return 'AttendanceScanResponseModel(success: $success, message: $message, student: $student, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $AttendanceScanResponseModelCopyWith<$Res>  {
  factory $AttendanceScanResponseModelCopyWith(AttendanceScanResponseModel value, $Res Function(AttendanceScanResponseModel) _then) = _$AttendanceScanResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, StudentResponseModel? student, AttendanceResponseModel? attendance
});


$StudentResponseModelCopyWith<$Res>? get student;$AttendanceResponseModelCopyWith<$Res>? get attendance;

}
/// @nodoc
class _$AttendanceScanResponseModelCopyWithImpl<$Res>
    implements $AttendanceScanResponseModelCopyWith<$Res> {
  _$AttendanceScanResponseModelCopyWithImpl(this._self, this._then);

  final AttendanceScanResponseModel _self;
  final $Res Function(AttendanceScanResponseModel) _then;

/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? student = freezed,Object? attendance = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as StudentResponseModel?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as AttendanceResponseModel?,
  ));
}
/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentResponseModelCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $StudentResponseModelCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceResponseModelCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
    return null;
  }

  return $AttendanceResponseModelCopyWith<$Res>(_self.attendance!, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceScanResponseModel].
extension AttendanceScanResponseModelPatterns on AttendanceScanResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceScanResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceScanResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceScanResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceScanResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceScanResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceScanResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  StudentResponseModel? student,  AttendanceResponseModel? attendance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceScanResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  StudentResponseModel? student,  AttendanceResponseModel? attendance)  $default,) {final _that = this;
switch (_that) {
case _AttendanceScanResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  StudentResponseModel? student,  AttendanceResponseModel? attendance)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceScanResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.student,_that.attendance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceScanResponseModel implements AttendanceScanResponseModel {
  const _AttendanceScanResponseModel({required this.success, required this.message, this.student, this.attendance});
  factory _AttendanceScanResponseModel.fromJson(Map<String, dynamic> json) => _$AttendanceScanResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  StudentResponseModel? student;
@override final  AttendanceResponseModel? attendance;

/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceScanResponseModelCopyWith<_AttendanceScanResponseModel> get copyWith => __$AttendanceScanResponseModelCopyWithImpl<_AttendanceScanResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceScanResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceScanResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.student, student) || other.student == student)&&(identical(other.attendance, attendance) || other.attendance == attendance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,student,attendance);

@override
String toString() {
  return 'AttendanceScanResponseModel(success: $success, message: $message, student: $student, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class _$AttendanceScanResponseModelCopyWith<$Res> implements $AttendanceScanResponseModelCopyWith<$Res> {
  factory _$AttendanceScanResponseModelCopyWith(_AttendanceScanResponseModel value, $Res Function(_AttendanceScanResponseModel) _then) = __$AttendanceScanResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, StudentResponseModel? student, AttendanceResponseModel? attendance
});


@override $StudentResponseModelCopyWith<$Res>? get student;@override $AttendanceResponseModelCopyWith<$Res>? get attendance;

}
/// @nodoc
class __$AttendanceScanResponseModelCopyWithImpl<$Res>
    implements _$AttendanceScanResponseModelCopyWith<$Res> {
  __$AttendanceScanResponseModelCopyWithImpl(this._self, this._then);

  final _AttendanceScanResponseModel _self;
  final $Res Function(_AttendanceScanResponseModel) _then;

/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? student = freezed,Object? attendance = freezed,}) {
  return _then(_AttendanceScanResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,student: freezed == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as StudentResponseModel?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as AttendanceResponseModel?,
  ));
}

/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentResponseModelCopyWith<$Res>? get student {
    if (_self.student == null) {
    return null;
  }

  return $StudentResponseModelCopyWith<$Res>(_self.student!, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of AttendanceScanResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceResponseModelCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
    return null;
  }

  return $AttendanceResponseModelCopyWith<$Res>(_self.attendance!, (value) {
    return _then(_self.copyWith(attendance: value));
  });
}
}


/// @nodoc
mixin _$StudentResponseModel {

 int get id; String get name;@JsonKey(name: 'student_no') String get studentNo;
/// Create a copy of StudentResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentResponseModelCopyWith<StudentResponseModel> get copyWith => _$StudentResponseModelCopyWithImpl<StudentResponseModel>(this as StudentResponseModel, _$identity);

  /// Serializes this StudentResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentNo, studentNo) || other.studentNo == studentNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,studentNo);

@override
String toString() {
  return 'StudentResponseModel(id: $id, name: $name, studentNo: $studentNo)';
}


}

/// @nodoc
abstract mixin class $StudentResponseModelCopyWith<$Res>  {
  factory $StudentResponseModelCopyWith(StudentResponseModel value, $Res Function(StudentResponseModel) _then) = _$StudentResponseModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'student_no') String studentNo
});




}
/// @nodoc
class _$StudentResponseModelCopyWithImpl<$Res>
    implements $StudentResponseModelCopyWith<$Res> {
  _$StudentResponseModelCopyWithImpl(this._self, this._then);

  final StudentResponseModel _self;
  final $Res Function(StudentResponseModel) _then;

/// Create a copy of StudentResponseModel
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


/// Adds pattern-matching-related methods to [StudentResponseModel].
extension StudentResponseModelPatterns on StudentResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StudentResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StudentResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'student_no')  String studentNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'student_no')  String studentNo)  $default,) {final _that = this;
switch (_that) {
case _StudentResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'student_no')  String studentNo)?  $default,) {final _that = this;
switch (_that) {
case _StudentResponseModel() when $default != null:
return $default(_that.id,_that.name,_that.studentNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentResponseModel implements StudentResponseModel {
  const _StudentResponseModel({required this.id, required this.name, @JsonKey(name: 'student_no') required this.studentNo});
  factory _StudentResponseModel.fromJson(Map<String, dynamic> json) => _$StudentResponseModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'student_no') final  String studentNo;

/// Create a copy of StudentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentResponseModelCopyWith<_StudentResponseModel> get copyWith => __$StudentResponseModelCopyWithImpl<_StudentResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.studentNo, studentNo) || other.studentNo == studentNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,studentNo);

@override
String toString() {
  return 'StudentResponseModel(id: $id, name: $name, studentNo: $studentNo)';
}


}

/// @nodoc
abstract mixin class _$StudentResponseModelCopyWith<$Res> implements $StudentResponseModelCopyWith<$Res> {
  factory _$StudentResponseModelCopyWith(_StudentResponseModel value, $Res Function(_StudentResponseModel) _then) = __$StudentResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'student_no') String studentNo
});




}
/// @nodoc
class __$StudentResponseModelCopyWithImpl<$Res>
    implements _$StudentResponseModelCopyWith<$Res> {
  __$StudentResponseModelCopyWithImpl(this._self, this._then);

  final _StudentResponseModel _self;
  final $Res Function(_StudentResponseModel) _then;

/// Create a copy of StudentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? studentNo = null,}) {
  return _then(_StudentResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,studentNo: null == studentNo ? _self.studentNo : studentNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AttendanceResponseModel {

 String get type; DateTime? get time;
/// Create a copy of AttendanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceResponseModelCopyWith<AttendanceResponseModel> get copyWith => _$AttendanceResponseModelCopyWithImpl<AttendanceResponseModel>(this as AttendanceResponseModel, _$identity);

  /// Serializes this AttendanceResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceResponseModel&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,time);

@override
String toString() {
  return 'AttendanceResponseModel(type: $type, time: $time)';
}


}

/// @nodoc
abstract mixin class $AttendanceResponseModelCopyWith<$Res>  {
  factory $AttendanceResponseModelCopyWith(AttendanceResponseModel value, $Res Function(AttendanceResponseModel) _then) = _$AttendanceResponseModelCopyWithImpl;
@useResult
$Res call({
 String type, DateTime? time
});




}
/// @nodoc
class _$AttendanceResponseModelCopyWithImpl<$Res>
    implements $AttendanceResponseModelCopyWith<$Res> {
  _$AttendanceResponseModelCopyWithImpl(this._self, this._then);

  final AttendanceResponseModel _self;
  final $Res Function(AttendanceResponseModel) _then;

/// Create a copy of AttendanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? time = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceResponseModel].
extension AttendanceResponseModelPatterns on AttendanceResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceResponseModel() when $default != null:
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
case _AttendanceResponseModel() when $default != null:
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
case _AttendanceResponseModel():
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
case _AttendanceResponseModel() when $default != null:
return $default(_that.type,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceResponseModel implements AttendanceResponseModel {
  const _AttendanceResponseModel({required this.type, required this.time});
  factory _AttendanceResponseModel.fromJson(Map<String, dynamic> json) => _$AttendanceResponseModelFromJson(json);

@override final  String type;
@override final  DateTime? time;

/// Create a copy of AttendanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceResponseModelCopyWith<_AttendanceResponseModel> get copyWith => __$AttendanceResponseModelCopyWithImpl<_AttendanceResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceResponseModel&&(identical(other.type, type) || other.type == type)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,time);

@override
String toString() {
  return 'AttendanceResponseModel(type: $type, time: $time)';
}


}

/// @nodoc
abstract mixin class _$AttendanceResponseModelCopyWith<$Res> implements $AttendanceResponseModelCopyWith<$Res> {
  factory _$AttendanceResponseModelCopyWith(_AttendanceResponseModel value, $Res Function(_AttendanceResponseModel) _then) = __$AttendanceResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String type, DateTime? time
});




}
/// @nodoc
class __$AttendanceResponseModelCopyWithImpl<$Res>
    implements _$AttendanceResponseModelCopyWith<$Res> {
  __$AttendanceResponseModelCopyWithImpl(this._self, this._then);

  final _AttendanceResponseModel _self;
  final $Res Function(_AttendanceResponseModel) _then;

/// Create a copy of AttendanceResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? time = freezed,}) {
  return _then(_AttendanceResponseModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
