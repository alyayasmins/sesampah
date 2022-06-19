import 'package:cloud_firestore/cloud_firestore.dart';

class ModelBalance {
  final String userId;
  final String status;
  final String proof;
  final int nominal;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ModelBalance({
    required this.userId,
    required this.status,
    required this.proof,
    required this.nominal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ModelBalance.fromData(DocumentSnapshot docs) {
    return ModelBalance(
      userId: docs.get('userId'),
      status: docs.get('status'),
      proof: docs.get('proof'),
      nominal: docs.get('nominal'),
      createdAt: docs.get('createdAt'),
      updatedAt: docs.get('updatedAt'),
    );
  }
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'status': status,
        'proof': status,
        'nominal': nominal,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
