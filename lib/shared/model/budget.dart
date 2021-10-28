class Budget {
  final int year;
  final int month;
  final String categoryId;
  final double budgetValue;
  final double amountSpent;

  String get id => '$categoryId$year$month';

  Budget({
    required this.year,
    required this.month,
    required this.categoryId,
    required this.budgetValue,
    required this.amountSpent,
  });

  static const YEAR = 'year';
  static const MONTH = 'month';
  static const CATEGORY_ID = 'categoryId';
  static const BUDGET_VALUE = 'budgetValue';
  static const AMOUNT_SPENT = 'amountSpent';

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        year: json[YEAR] ?? 2000,
        month: json[MONTH] ?? 1,
        categoryId: json[CATEGORY_ID] ?? '',
        budgetValue: json[BUDGET_VALUE] ?? 0.0,
        amountSpent: json[AMOUNT_SPENT] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        YEAR: year,
        MONTH: month,
        CATEGORY_ID: categoryId,
        BUDGET_VALUE: budgetValue,
      };
}
