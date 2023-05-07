import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/attendance_modal.dart';

final attendanceAPIProvider = Provider((ref) {
  return AttendanceAPI();
});

final dio = Dio();

abstract class IAttendanceAPI {
  FutureEither<AttendanceModal> getData(String rollno);
}

class AttendanceAPI extends IAttendanceAPI {
  @override
  FutureEither<AttendanceModal> getData(String rollno) async {
    try {
      final res = await dio.get('${apiUrl}getAttendance', data: {"rno": rollno});
      final parsed = AttendanceModal.fromJson(res.data['data']);
      return right(parsed);
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
