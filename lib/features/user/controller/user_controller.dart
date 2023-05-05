
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/auth_api.dart';
import 'package:mlrcc/apis/user_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/modals/user_modal.dart';

final userDataProvider = StateProvider<UserModal?>((ref) => null);

final userControllerProvider =
    StateNotifierProvider<UserController, bool>((ref) {
  return UserController(
      authAPI: ref.watch(authAPIProvider),
      userAPI: ref.watch(userAPIProvider),
      ref: ref);
});

class UserController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  final Ref _ref;
  UserController(
      {required AuthAPI authAPI, required UserAPI userAPI, required Ref ref})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        _ref = ref,
        super(false);

  void saveUserData({
    required BuildContext context,
    required String uid,
    required String name,
    required String email,
    required String rno,
    required String branch,
    required int semester,
    required int year,
    required String phone,
    required String section,
    required String imageUrl,
  }) async {
    state = true;
    var res = await _userAPI.saveUserData(
      uid: uid,
      name: name,
      email: email,
      rno: rno,
      branch: branch,
      semester: semester,
      year: year,
      phone: phone,
      section: section,
      imageUrl: imageUrl,
    );
    res.fold((l) => showSnackBar(context, l.message), (r) {
      _ref.read(userDataProvider.notifier).update((state) => r);
    });
    Navigator.of(context).pop();
    state = false;
  }

  void getUserData({
    required BuildContext context,
    required String uid,
  }) async {
    state = true;
    var res = await _userAPI.getUserData(uid);
    res.fold((l) => showSnackBar(context, l.message), (r) {
      _ref.read(userDataProvider.notifier).update((state) => r);
    });
    state = false;
  }

  void updateUserData({
    required BuildContext context,
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
    state = true;
    var res = await _userAPI.updateUserData(
      uid: uid,
      name: name,
      email: email,
      rno: rno,
      branch: branch,
      semester: semester,
      year: year,
      phone: phone,
      section: section,
    );
    res.fold((l) => showSnackBar(context, l.message), (r) {
      _ref.read(userDataProvider.notifier).update((state) => r);
    });
    state = false;
  }
}
