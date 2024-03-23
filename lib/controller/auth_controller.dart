import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lets_meet_app/controller/navigator.dart';
import 'package:lets_meet_app/view/pages/home_page.dart';
import 'package:lets_meet_app/view/pages/login_page.dart';

class AuthController {
  static Future<UserCredential> loginWithEmail(
      String email, String password) async {
    final firebaseAuth = FirebaseAuth.instance;
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found');
      } else if (e.code == 'wrong-password') {
        log('Wrong password');
      } else {
        log('Cannot log in');
      }
    }
    return loginWithEmail(email, password);
  }

  static Future<UserCredential?> signUpWithEmail(
      String email, String password) async {
    final firebaseAuth = FirebaseAuth.instance;
    try {
      return firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('Weak password');
      } else if (e.code == 'email-already-in-use') {
        log('This email already exists');
      } else {
        log('Cannot sign up');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<void> verifyEmail() async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  static Future<void> continueWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Future.sync(() => navigatePushAndRemove(const HomePage(), context));
    } catch (e) {
      log(e.toString());
      log('Cannot login, please try again');
    }
  }

  static Future<void> logOut(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    Future.sync(() => navigatePushAndRemove(const LoginPage(), context));
  }
}
