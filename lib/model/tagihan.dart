import 'package:cloud_firestore/cloud_firestore.dart';

class TagihanModel {
  final String id;
  final String nop;
  final String pokok;
  final String denda;
  final String tahun;

  const TagihanModel({
    required this.id,
    required this.nop,
    required this.pokok,
    required this.denda,
    required this.tahun
  });

  factory TagihanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TagihanModel(id: document.id, nop: data["nop"], pokok: data["pokok"], denda: data["denda"], tahun: data["tahun"]);
  }
}