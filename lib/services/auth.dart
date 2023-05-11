import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future registerWithEmailAndPassword(
  String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      return true;
    } on FirebaseAuthException catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }

  static Future signInWithEmailAndPassword(
  String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }

  static Future deleteUser() async {
    try {
      await _auth.currentUser!.delete();
      return true;
    } on FirebaseAuthException catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }

  static getCurrentEmail() {
    final user = _auth.currentUser;

    if (user != null) {
      final emailUser = user.email;
      return emailUser;
    }

    return false;
  }

  static getCurrentUser() {
    final user = _auth.currentUser;

    if(user != null) {
      return true;
    }
    return false;
  }

  static Future signOut() async {
    await _auth.signOut();
    return true;
  }
}
