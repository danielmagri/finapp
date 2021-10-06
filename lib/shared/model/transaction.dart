import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Transaction {
  final String? id;
  final double value;
  final String payeeId;
  final String categoryId;
  final DateTime datetime;

  DateTime get date => DateTime(datetime.year, datetime.month, datetime.day);

  Transaction({
    this.id,
    required this.value,
    required this.payeeId,
    required this.categoryId,
    required this.datetime,
  });

  factory Transaction.fromJson(Map<String, dynamic> json, String id) =>
      Transaction(
        id: id,
        value: json['value'] ?? 0,
        payeeId: json['payeeId'] ?? '',
        categoryId: json['categoryId'] ?? '',
        datetime: DateTime.fromMillisecondsSinceEpoch(
            (json['date'] as Timestamp).millisecondsSinceEpoch),
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'payeeId': payeeId,
        'categoryId': categoryId,
        'date': datetime,
      };
}
