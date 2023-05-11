import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simop/model/riwayat_tagihan.dart';
import 'package:simop/model/tagihan.dart';
import 'package:simop/services/auth.dart';

class Tagihan {
  static final _db = FirebaseFirestore.instance;

  static Future<List<TagihanModel>> getData(String nop) async {
    final snapshot = await _db.collection("tagihan").where("nop", isEqualTo: nop).get();
    final tagihanData = snapshot.docs.map((e) => TagihanModel.fromSnapshot(e)).toList();
    return tagihanData;
  }

  static Future deleteTagihan(String nop) async {
    try {
      final snapshot = await _db.collection("tagihan").where("nop", isEqualTo: nop).get();
      final tagihanData = snapshot.docs.map((e) => TagihanModel.fromSnapshot(e)).single;
      final idTagihan = tagihanData.id;
      await _db.collection("tagihan").doc(idTagihan).delete();
    } on FirebaseException catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 16,
      );
    } catch(e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 16,
      );
    }
  }

  static Future<String> getIDRiwayatTagihan(String nop, String tahun) async {
    try {
      final email = Auth.getCurrentEmail();
      final snapshot = await _db.collection("riwayat_tagihan").where("email", isEqualTo: email).where("nop", isEqualTo: nop).where("tahun", isEqualTo: tahun).get();
      final riwayatTagihanData = snapshot.docs.map((e) => RiwayatTagihanModel.fromSnapshot(e)).single;
      final idRiwayatTagihanData = riwayatTagihanData.id;
      return idRiwayatTagihanData;
    } on FirebaseException catch(e) {
      return "$e";
    } catch (e) {
      return "$e";
    }
  }
}
