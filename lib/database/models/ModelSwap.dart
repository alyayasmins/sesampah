import 'package:cloud_firestore/cloud_firestore.dart';

class ModelBalance {
  final String userId;
  final String status;
  final String proof;
  final Map trash;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ModelBalance({
    required this.userId,
    required this.status,
    required this.proof,
    required this.trash,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ModelBalance.fromData(DocumentSnapshot docs) {
    return ModelBalance(
      userId: docs.get('userId'),
      status: docs.get('status'),
      proof: docs.get('proof'),
      trash: docs.get('trash'),
      createdAt: docs.get('createdAt'),
      updatedAt: docs.get('updatedAt'),
    );
  }
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'status': status,
        'proof': status,
        'trash': trash,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
