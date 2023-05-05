import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/modals/user_modal.dart';

import '../core/core.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI();
});

abstract class IUserAPI {
  // FutureEither<UserModal> saveUserData();
  // FutureEitherVoid saveUserData();
  FutureEither<UserModal> getUserData(String uid);
}

class UserAPI extends IUserAPI{
  @override
  FutureEither<UserModal> getUserData(String uid) async {
    try {
      final userData =
          await http.get(Uri.parse('${apiUrl}}'));
      final userDataJson = jsonDecode(userData.body) as List;
      final userDataList = userDataJson
          .map((e) => UserModal.fromMap(e as Map<String, dynamic>))
          .toList();
      return right(userDataList[0]);
    } catch (e) {
      return left(Failure(e.toString(), StackTrace.empty));
    }
  }
}
