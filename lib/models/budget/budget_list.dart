import 'package:mufin/models/budget/budget.dart';

class BudgetList {
  final List<Budget>? budgets;

  BudgetList({
    this.budgets,
  });

  factory BudgetList.fromJson(List<dynamic> json) {
    List<Budget> budgets = <Budget>[];
    budgets = json.map((budget) => Budget.fromMap(budget)).toList();

    return BudgetList(budgets: budgets);
  }
}