import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  final String fullName;
  final String email;
  final String password;
  final String address;
  final String balance;
  final String role;
  final String createdAt;

  Model({
    required this.fullName,
    required this.email,
    required this.password,
    required this.address,
    required this.balance,
    required this.role,
    required this.createdAt,
  });

  factory Model.fromData(DocumentSnapshot docs) {
    return Model(
        fullName: docs.get('fullName'),
        email: docs.get('email'),
        password: docs.get('password'),
        address: docs.get('address'),
        balance: docs.get('balance'),
        role: docs.get('role'),
        createdAt: docs.get('createdAt'));
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'address': address,
        'balance': balance,
      };
}
