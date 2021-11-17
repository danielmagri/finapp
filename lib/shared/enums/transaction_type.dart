enum TransactionType { OUTCOME, INCOME }

extension TransactionTypeExtension on TransactionType {
  int parseInt() {
    switch (this) {
      case TransactionType.INCOME:
        return 1;
      case TransactionType.OUTCOME:
        return 0;
    }
  }

  String get prettyText {
    switch (this) {
      case TransactionType.INCOME:
        return "Renda";
      case TransactionType.OUTCOME:
        return "Gasto";
    }
  }
}

TransactionType parseType(int value) {
  switch (value) {
    case 1:
      return TransactionType.INCOME;
    case 0:
    default:
      return TransactionType.OUTCOME;
  }
}
