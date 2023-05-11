import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  final String id;
  final String email;
  final String name;
  final String nohp;

  const UsersModel({
    required this.id,
    required this.email,
    required this.name,
    required this.nohp
  });

  factory UsersModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UsersModel(id: document.id, email: data["email"], name: data["name"], nohp: data["nohp"]);
  }
}