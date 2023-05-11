import 'package:cloud_firestore/cloud_firestore.dart';

class RiwayatTagihanModel {
  final String id;
  final String email;
  final String nop;
  final String pokok;
  final String denda;
  final String total;
  final String tahun;
  final String metode;
  final String datetime;

  const RiwayatTagihanModel({
    required this.id,
    required this.email,
    required this.nop,
    required this.pokok,
    required this.denda,
    required this.total,
    required this.tahun,
    required this.metode,
    required this.datetime
  });

  factory RiwayatTagihanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RiwayatTagihanModel(id: document.id, email: data["email"], nop: data["nop"], pokok: data["pokok"], denda: data["denda"], total: data["total"], tahun: data["tahun"], metode: data["metode"], datetime: data["datetime"]);
  }
}