import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import '../enums/transaction_type.dart';

class Transaction {
  final String? id;
  final TransactionType type;

  final double value;
  final DateTime datetime;

  final String? categoryId;

  DateTime get date => DateTime(datetime.year, datetime.month, datetime.day);

  String get valueText => value.toStringAsFixed(2);

  Transaction({
    this.id,
    required this.type,
    required this.value,
    required this.datetime,
    this.categoryId,
  });

  static const TYPE = 'type';
  static const VALUE = 'value';
  static const DATETIME = 'date';
  static const CATEGORY_ID = 'categoryId';

  factory Transaction.fromJson(Map<String, dynamic> json, String id) =>
      Transaction(
        id: id,
        type: parseType(json[TYPE] ?? 0),
        value: json[VALUE] ?? 0.0,
        datetime: DateTime.fromMillisecondsSinceEpoch(
            (json[DATETIME] as Timestamp).millisecondsSinceEpoch),
        categoryId: json[CATEGORY_ID],
      );

  Map<String, dynamic> toJson() => {
        TYPE: type.parseInt(),
        VALUE: value,
        DATETIME: datetime,
        if (categoryId != null) CATEGORY_ID: categoryId,
      };
}
