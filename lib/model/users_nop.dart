import 'package:cloud_firestore/cloud_firestore.dart';

class UsersNOPModel {
  final String id;
  final String email;
  final String nop;
  final String catatan;

  const UsersNOPModel({
    required this.id,
    required this.email,
    required this.nop,
    required this.catatan
  });

  factory UsersNOPModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UsersNOPModel(id: document.id, email: data["email"], nop: data["nop"], catatan: data["catatan"]);
  }
}