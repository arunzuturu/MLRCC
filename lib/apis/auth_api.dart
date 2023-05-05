import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/core/providers.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(authProvider);
  return AuthAPI(
    auth: account,
  );
});

abstract class IAuthAPI {
  FutureEither<UserCredential> signInWithGoogle(BuildContext context);
  FutureVoid signOut();
}

class AuthAPI implements IAuthAPI {
  final FirebaseAuth _auth;
  AuthAPI({required FirebaseAuth auth}) : _auth = auth;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  @override
  FutureEither<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return right(userCredential);
      } else {
        return left(Failure('Google Sign In Failed', StackTrace.empty));
      }
    } on FirebaseAuthException catch (e, st) {
      return left(Failure(e.message ?? e.toString(), st));
    }
  }
  
  @override
  FutureVoid signOut() async{
    await GoogleSignIn().signOut();
    return await _auth.signOut();
  }
}
