class BudgetCategory {
  final String categoryId;
  final double budgetValue;
  final double amountSpent;

  BudgetCategory({
    required this.categoryId,
    required this.budgetValue,
    required this.amountSpent,
  });

  static const BUDGET_VALUE = 'budgetValue';
  static const AMOUNT_SPENT = 'amountSpent';

  factory BudgetCategory.fromJson(
          Map<String, dynamic> json, String categoryId) =>
      BudgetCategory(
        categoryId: categoryId,
        budgetValue: json[BUDGET_VALUE] ?? 0.0,
        amountSpent: json[AMOUNT_SPENT] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        BUDGET_VALUE: budgetValue,
      };
}
