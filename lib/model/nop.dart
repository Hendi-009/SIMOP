import 'package:cloud_firestore/cloud_firestore.dart';

class NOPModel {
  final String id;
  final String nop;
  final String namaWp;
  final String kecamatan;
  final String kelurahan;

  const NOPModel({
    required this.id,
    required this.nop,
    required this.namaWp,
    required this.kecamatan,
    required this.kelurahan
  });

  factory NOPModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return NOPModel(id: document.id, nop: data["nop"], namaWp: data["namaWp"], kecamatan: data["kecamatan"], kelurahan: data["kelurahan"]);
  }
}