import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/attendance_scan_request.dart';
import '../models/attendance_scan_response_model.dart';

part 'attendance_api_service.g.dart';

@RestApi()
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio, {String baseUrl}) = _AttendanceApiService;

  @POST('/api/student-attendance/scan')
  Future<AttendanceScanResponseModel> scanAttendance(
    @Body() AttendanceScanRequest request,
  );
}
