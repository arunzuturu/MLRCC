import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/attendance_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/modals.dart';

final attendanceDataProvider = StateProvider<AttendanceModal?>((ref) => null);

final attendanceControllerProvider =
    StateNotifierProvider<AttendanceController, bool>((ref) {
  return AttendanceController(
      attendanceAPI: ref.watch(attendanceAPIProvider), ref: ref);
});

class AttendanceController extends StateNotifier<bool> {
  final Ref _ref;
  final AttendanceAPI _attendanceAPI;

  AttendanceController({required AttendanceAPI attendanceAPI, required Ref ref})
      : _attendanceAPI = attendanceAPI,
        _ref = ref,
        super(false);

  Future<void> getAttendance(BuildContext context, String rollno) async {
    state = true;
    final res = await _attendanceAPI.getData(rollno);
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      _ref.read(attendanceDataProvider.notifier).update((state) => r);
    });
  }
}
