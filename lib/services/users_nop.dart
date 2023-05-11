import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simop/model/users_nop.dart';
import 'package:simop/screen/masyarakat/nop_disimpan.dart';
import 'package:simop/services/auth.dart';

class UsersNOP {
  static final _db = FirebaseFirestore.instance;

  static Stream<List<UsersNOPModel>> getData() async* {
    final email = Auth.getCurrentEmail();
    final snapshot = await _db
        .collection("users_nop")
        .where("email", isEqualTo: email)
        .get();
    final usersNOPData =
        snapshot.docs.map((e) => UsersNOPModel.fromSnapshot(e)).toList();
    yield usersNOPData;
  }

  static Future<String> isBookmark(String nop) async {
    try {
      final email = Auth.getCurrentEmail();
      final snapshot = await _db
          .collection("users_nop")
          .where("email", isEqualTo: email)
          .where("nop", isEqualTo: nop)
          .get();
      snapshot.docs.map((e) => UsersNOPModel.fromSnapshot(e)).single;
      return "Found";
    } on FirebaseException catch (e) {
      return "Not Found";
    } catch (e) {
      return "Not Found";
    }
  }

  static Future createUsersNOP(String nop, String catatan) async {
    try {
      final email = Auth.getCurrentEmail();
      await _db.collection("users_nop").add({
        "email": email,
        "nop": nop,
        "catatan": catatan,
      });
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "NOP berhasil disimpan",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        onConfirm: () {
          Get.back();
        },
        radius: 16,
      );
      return true;
    } on FirebaseException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }

  static Future deleteUsersNOP(String nop) async {
    try {
      final email = Auth.getCurrentEmail();
      final snapshot = await _db
          .collection("users_nop")
          .where("email", isEqualTo: email)
          .where("nop", isEqualTo: nop)
          .get();
      final userData =
          snapshot.docs.map((e) => UsersNOPModel.fromSnapshot(e)).single;
      final idUserNOP = userData.id;
      await _db.collection("users_nop").doc(idUserNOP).delete();
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "NOP berhasil dihapus",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        onConfirm: () {
          Get.back();
          Get.back();
          Get.back();
          Get.to(NOPDisimpanWidget());
        },
        radius: 16,
      );
      return true;
    } on FirebaseException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }

  static Future updateUsersNOP(String nop, String catatan) async {
    try {
      final email = Auth.getCurrentEmail();
      final snapshot = await _db
          .collection("users_nop")
          .where("email", isEqualTo: email)
          .where("nop", isEqualTo: nop)
          .get();
      final usersNOPData =
          snapshot.docs.map((e) => UsersNOPModel.fromSnapshot(e)).single;
      final idUsersNOP = usersNOPData.id;
      await _db.collection("users_nop").doc(idUsersNOP).update({
        "catatan": catatan,
      });
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "NOP berhasil diperbaharui",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        onConfirm: () {
          Get.back();
          Get.back();
        },
        radius: 16,
      );
      return true;
    } on FirebaseException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 16,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
      return false;
    }
  }
}
