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
      final userData = await http.get(Uri.parse('${apiUrl}}'));
      final userDataJson = jsonDecode(userData.body) as List;
      final userDataList = userDataJson
          .map((e) => UserModal.fromJson(e as Map<String, dynamic>))
          .toList();
      return right(userDataList[0]);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }

  FutureEither<UserModal> saveUserData({
    required String uid,
    required String name,
    required String email,
  }) async {
    try {
      final userData = await dio.get('${apiUrl}signup', queryParameters: {
        "name": name,
        "email": email,
        "rno": "",
        "uid": uid,
        "branch": "",
        "semester": 0,
        "year": 0,
        "phone": "",
        "section": ""
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
