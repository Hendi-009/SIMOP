import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simop/model/riwayat_tagihan.dart';
import 'package:simop/services/auth.dart';

class RiwayatTagihan {
  static final _db = FirebaseFirestore.instance;

  static Future<List<RiwayatTagihanModel>> getData() async {
    final email = Auth.getCurrentEmail();
    final snapshot = await _db.collection("riwayat_tagihan").where("email", isEqualTo: email).get();
    final riwayatTagihanData = snapshot.docs.map((e) => RiwayatTagihanModel.fromSnapshot(e)).toList();
    return riwayatTagihanData;
  }

  static Future createRiwayatTagihan(String nop, String pokok, String denda, String tahun, String metode) async {
    try {
      final email = Auth.getCurrentEmail();
      DateTime now = DateTime.now();
      int day = now.day;
      int month = now.month;
      int year = now.year;
      await _db.collection("riwayat_tagihan").add({
        "email": email,
        "nop": nop,
        "pokok": pokok,
        "denda": denda,
        "total": (int.parse(pokok) + int.parse(denda)).toString(),
        "tahun": tahun,
        "metode": metode,
        "datetime": "$day-$month-$year"
      });
      return true;
    } on FirebaseException catch(e) {
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
}