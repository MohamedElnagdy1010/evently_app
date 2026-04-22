// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthWithGoogle {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signIn() async {
    try {
      if (kDebugMode) {
        print("111111111111");
      }

      // initialize
      await GoogleSignIn.instance.initialize(
        serverClientId:
            "516183552035-dmcm2p3raoj1e3fu5bvrv67d7p71mbp8.apps.googleusercontent.com",
      );

      if (kDebugMode) {
        print("222222222222");
      }

      // استخدم instance بعد initialize
      final googleAccount =
          await GoogleSignIn.instance.authenticate();

      if (kDebugMode) {
        print("333333333333");
      }

      final googleAuth = googleAccount.authentication;

      final credential = GoogleAuthProvider.credential(
       // مهم
        idToken: googleAuth.idToken,
      );

      if (kDebugMode) {
        print("444444444444");
      }

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

      print("555555555555");

      return userCredential.user;
    } catch (e) {
      print("Google Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await Future.wait([
      GoogleSignIn.instance.signOut(),
      firebaseAuth.signOut(),
    ]);
  }
}