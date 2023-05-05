import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
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
      final userData = await dio.get('${apiUrl}getUser', queryParameters: {
        "uid": uid,
      });
      final userDataJson = jsonDecode(userData.data);
      print(userDataJson);
      final userDataList = UserModal.fromJson(userDataJson);
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
    print(1);
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
        "section": section
        // "imageUrl": imageUrl
      });
      final userDataJson = jsonDecode(userData.data['data']);
      
      final userDataList = UserModal.fromJson(userDataJson);
      return right(userDataList);
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
      print(userDataJson);
      final userDataList = userDataJson
          .map((e) => UserModal.fromJson(e as Map<String, dynamic>));
      return right(userDataList.first);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }
}
