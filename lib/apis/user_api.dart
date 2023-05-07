import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/modals/user_modal.dart';

import '../core/core.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI();
});

final dio = Dio();

abstract class IUserAPI {
  // FutureEither<UserModal> saveUserData();
  // FutureEitherVoid saveUserData();
  FutureEither<UserModal> getUserData(String uid);
}

class UserAPI extends IUserAPI {
  @override
  FutureEither<UserModal> getUserData(String uid) async {
    try {
      final userData = await dio.get('${apiUrl}getUser', data: {"uid": uid});
      final userDataList = UserModal.fromJson(userData.data['data']);
      return right(userDataList);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }

  FutureEither<UserModal> saveUserData({
    required String uid,
    required String name,
    required String email,
    required String imageUrl,
    required String rno,
    required String branch,
    required int semester,
    required int year,
    required String phone,
    required String section,
  }) async {
    try {
      final userData = await dio.post('${apiUrl}signup', data: {
        "name": name,
        "email": email,
        "rno": rno,
        "uid": uid,
        "branch": branch,
        "semester": semester,
        "year": year,
        "phone": phone,
        "section": section,
        "imageUrl": imageUrl
      });
      final userDataList = UserModal.fromJson(userData.data['data']);
      return right(userDataList);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }

  FutureEither<String> getTimeTableUrl({
    required String branch,
    required int year,
    required String section,
  }) async {
    try {
      final timetableData = await dio.post('${apiUrl}getTimetable',
          data: {"branch": branch, "year": year, "section": section});
      return right(timetableData.data['data']['imageURL']);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }

  FutureEither<UserModal> updateUserData({
    required String uid,
    required String name,
    required String email,
    required String rno,
    required String branch,
    required int semester,
    required int year,
    required String phone,
    required String section,
  }) async {
    try {
      final userData = await dio.get('${apiUrl}updateUser', queryParameters: {
        "name": name,
        "email": email,
        "rno": rno,
        "uid": uid,
        "branch": branch,
        "semester": semester,
        "year": year,
        "phone": phone,
        "section": section
      });
      final userDataJson = jsonDecode(userData.data);
      final userDataList = userDataJson
          .map((e) => UserModal.fromJson(e as Map<String, dynamic>));
      return right(userDataList.first);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }
}
