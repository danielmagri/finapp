class Transaction {
  final String? id;
  final double value;
  final String payeeId;
  final String categoryId;

  Transaction(
      {this.id,
      required this.value,
      required this.payeeId,
      required this.categoryId});

  factory Transaction.fromJson(Map<String, dynamic> json, String id) =>
      Transaction(
          id: id,
          value: json['value'] ?? 0,
          payeeId: json['payeeId'] ?? '',
          categoryId: json['categoryId'] ?? '');

  Map<String, dynamic> toJson() => {
        'value': value,
        'payeeId': payeeId,
        'categoryId': categoryId,
      };
}
