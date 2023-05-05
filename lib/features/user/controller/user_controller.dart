import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/auth_api.dart';
import 'package:mlrcc/apis/user_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/user_modal.dart';

final userDataProvider = StateProvider<UserModal?>((ref) => null);

class UserController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  final Ref _ref;
  UserController({required AuthAPI authAPI, required UserAPI userAPI, required Ref ref})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        _ref = ref,
        super(false);

  void saveUserData({
    required BuildContext context,
    required User user,
  }) async {
    state = true;
    var res = await _userAPI.saveUserData(
      uid: user.uid,
      name: user.displayName!,
      email: user.email!,
    );
    res.fold((l) => showSnackBar(context, l.message), (r) {});
    state = false;
  }
}
