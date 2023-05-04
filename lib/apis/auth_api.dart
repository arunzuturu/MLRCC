import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/core/enums/user_is_new.dart';
import 'package:mlrcc/core/providers.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(authProvider);
  return AuthAPI(
    auth: account,
  );
});

abstract class IAuthAPI {
  FutureEither<UserAccountType> signInWithGoogle(BuildContext context);
}

class AuthAPI implements IAuthAPI {
  final FirebaseAuth _auth;
  AuthAPI({required FirebaseAuth auth}) : _auth = auth;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  @override
  FutureEither<UserAccountType> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      print(googleAuth?.idToken);

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        print(userCredential.user);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            return right(UserAccountType.newuser);
          }
        }
        return right(UserAccountType.returninguser);
      }
      return right(UserAccountType.erroroccoured);
    } on FirebaseAuthException catch (e, st) {
      return left(Failure(e.message ?? e.toString(), st));
    }
  }
}
