import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simop/model/nop.dart';

class NOP {
  static final _db = FirebaseFirestore.instance;

  static Stream<String> getNOP(String nop) async* {
    try {
      final snapshot = await _db.collection("nop").where("nop", isEqualTo: nop).get();
      final nopData = snapshot.docs.map((e) => NOPModel.fromSnapshot(e)).single;
      final nopNopData = nopData.nop;
      yield nopNopData;
    } on FirebaseException catch(e) {
      yield "$e";
    } catch (e) {
      yield "$e";
    }
  }

  static Future<String> getNamaWp(String nop) async {
    try {
      final snapshot = await _db.collection("nop").where("nop", isEqualTo: nop).get();
      final nopData = snapshot.docs.map((e) => NOPModel.fromSnapshot(e)).single;
      final nopNopData = nopData.namaWp;
      return nopNopData;
    } on FirebaseException catch(e) {
      return "$e";
    } catch (e) {
      return "$e";
    }
  }

  static Future<String> getKecamatan(String nop) async {
    try {
      final snapshot = await _db.collection("nop").where("nop", isEqualTo: nop).get();
      final nopData = snapshot.docs.map((e) => NOPModel.fromSnapshot(e)).single;
      final nopNopData = nopData.kecamatan;
      return nopNopData;
    } on FirebaseException catch(e) {
      return "$e";
    } catch (e) {
      return "$e";
    }
  }

  static Future<String> getKelurahan(String nop) async {
    try {
      final snapshot = await _db.collection("nop").where("nop", isEqualTo: nop).get();
      final nopData = snapshot.docs.map((e) => NOPModel.fromSnapshot(e)).single;
      final nopNopData = nopData.kelurahan;
      return nopNopData;
    } on FirebaseException catch(e) {
      return "$e";
    } catch (e) {
      return "$e";
    }
  }
}