import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class Transaction {
  final String? id;
  final String value;
  final String categoryId;
  final DateTime datetime;

  DateTime get date => DateTime(datetime.year, datetime.month, datetime.day);

  double get valueNum => double.parse(value);

  Transaction({
    this.id,
    required this.value,
    required this.categoryId,
    required this.datetime,
  });

  static const VALUE = 'value';
  static const CATEGORY_ID = 'categoryId';
  static const DATETIME = 'date';

  factory Transaction.fromJson(Map<String, dynamic> json, String id) =>
      Transaction(
        id: id,
        value: json[VALUE] ?? '0',
        categoryId: json[CATEGORY_ID] ?? '',
        datetime: DateTime.fromMillisecondsSinceEpoch(
            (json[DATETIME] as Timestamp).millisecondsSinceEpoch),
      );

  Map<String, dynamic> toJson() => {
        VALUE: value,
        CATEGORY_ID: categoryId,
        DATETIME: datetime,
      };
}
