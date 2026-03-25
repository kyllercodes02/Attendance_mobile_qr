class TeacherDashboardData {
  const TeacherDashboardData({
    this.teacherName,
    this.todaySchedule = const <TeacherClassSchedule>[],
    required this.totalClasses,
    required this.completedClasses,
    required this.pendingClasses,
    required this.attendanceRate,
  });

  final String? teacherName;
  final List<TeacherClassSchedule> todaySchedule;
  final int totalClasses;
  final int completedClasses;
  final int pendingClasses;
  final double attendanceRate;

  factory TeacherDashboardData.fromJson(Map<String, dynamic> json) {
    final teacherName = _readString(json, const [
      'teacher_name',
      'teacherName',
      'name',
    ]);
    final nestedTeacher = _readMap(json, const ['teacher', 'user']);
    final resolvedTeacherName =
        teacherName ??
        _readString(nestedTeacher, const [
          'name',
          'teacher_name',
          'teacherName',
        ]);

    final scheduleList = _readList(json, const [
      'today_schedule',
      'todaySchedule',
      'today_classes',
      'todayClasses',
      'classes',
      'schedules',
    ]);

    final todaySchedule = scheduleList
        .whereType<Map>()
        .map((raw) => raw.cast<String, dynamic>())
        .map(TeacherClassSchedule.fromJson)
        .toList(growable: false);

    final stats = _readMap(json, const [
      'attendance_summary',
      'attendanceSummary',
      'statistics',
      'stats',
      'summary',
    ]);

    final totalClasses =
        _readInt(stats, const [
          'total_classes',
          'totalClasses',
          'total',
          'class_count',
        ]) ??
        todaySchedule.length;

    final completedClasses =
        _readInt(stats, const [
          'completed_classes',
          'completedClasses',
          'completed',
        ]) ??
        0;

    final pendingClasses =
        _readInt(stats, const [
          'pending_classes',
          'pendingClasses',
          'pending',
        ]) ??
        (totalClasses - completedClasses).clamp(0, totalClasses);

    final attendanceRate =
        _readDouble(stats, const [
          'attendance_rate',
          'attendanceRate',
          'rate',
        ]) ??
        (totalClasses == 0 ? 0 : (completedClasses / totalClasses) * 100);

    return TeacherDashboardData(
      teacherName: resolvedTeacherName,
      todaySchedule: todaySchedule,
      totalClasses: totalClasses,
      completedClasses: completedClasses.clamp(0, totalClasses),
      pendingClasses: pendingClasses.clamp(0, totalClasses),
      attendanceRate: attendanceRate.clamp(0, 100),
    );
  }
}

class TeacherClassSchedule {
  const TeacherClassSchedule({
    required this.time,
    required this.subject,
    required this.section,
  });

  final String time;
  final String subject;
  final String section;

  factory TeacherClassSchedule.fromJson(Map<String, dynamic> json) {
    final time = _readString(json, const [
      'time',
      'start_time',
      'startTime',
      'schedule_time',
      'scheduleTime',
    ]);
    final subject = _readString(json, const [
      'subject',
      'course',
      'course_name',
      'courseName',
      'name',
      'title',
    ]);
    final section = _readString(json, const [
      'section',
      'class',
      'class_name',
      'className',
      'section_name',
      'sectionName',
    ]);

    return TeacherClassSchedule(
      time: time ?? '-',
      subject: subject ?? 'Unspecified Subject',
      section: section ?? 'Unspecified Section',
    );
  }
}

Map<String, dynamic>? _readMap(
  Map<String, dynamic>? source,
  List<String> keys,
) {
  if (source == null) {
    return null;
  }
  for (final key in keys) {
    final value = source[key];
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return value.cast<String, dynamic>();
    }
  }
  return null;
}

List<dynamic> _readList(Map<String, dynamic> source, List<String> keys) {
  for (final key in keys) {
    final value = source[key];
    if (value is List) {
      return value;
    }
  }
  return const <dynamic>[];
}

String? _readString(Map<String, dynamic>? source, List<String> keys) {
  if (source == null) {
    return null;
  }
  for (final key in keys) {
    final value = source[key];
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }
  }
  return null;
}

int? _readInt(Map<String, dynamic>? source, List<String> keys) {
  if (source == null) {
    return null;
  }
  for (final key in keys) {
    final value = source[key];
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      final parsed = int.tryParse(value.trim());
      if (parsed != null) {
        return parsed;
      }
    }
  }
  return null;
}

double? _readDouble(Map<String, dynamic>? source, List<String> keys) {
  if (source == null) {
    return null;
  }
  for (final key in keys) {
    final value = source[key];
    if (value is double) {
      return value;
    }
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      final parsed = double.tryParse(value.trim());
      if (parsed != null) {
        return parsed;
      }
    }
  }
  return null;
}
