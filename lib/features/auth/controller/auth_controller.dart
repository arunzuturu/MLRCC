import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/apis/auth_api.dart';
import 'package:mlrcc/apis/user_api.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/features/auth/views/insert_user_details.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authAPI: ref.watch(authAPIProvider), userAPI: ref.watch(userAPIProvider));
});
// final currentUserDetailsProvider = FutureProvider((ref) async {
//   final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
//   final userDetails = ref.watch(userDetailsProvider(currentUserId));
//   return userDetails.value;
// });
// final userDetailsProvider = FutureProvider.family((ref, String uid) async {
//   final authController = ref.watch(authControllerProvider.notifier);
//   return authController.getUserData(uid);
// });
final curentUserAccountProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  Stream<User?> get authStateChange => _authAPI.authStateChange;
  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authAPI.signInWithGoogle(context);
    state = false;
    user.fold((l) => showSnackBar(context, l.message), (userCredential) {
      if (userCredential.user!.email!.contains('mlrinstitutions.ac.in')) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          Navigator.push(context, InsertUserDetailsView.route());
        }
        _userAPI.getUserData(userCredential.user!.uid);
      } else {
        _authAPI.signOut();
        showSnackBar(context, 'Please use your @mlrinstitutions.ac.in email');
      }
    });
  }
}
