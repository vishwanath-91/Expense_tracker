import 'package:expenses_tracker_app/lib/widgets/expenses_list/expense_items_for_list.dart';
import 'package:flutter/material.dart';

import '../../Expense Model/expense_model.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key, required this.expenses}) : super(key: key);
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseItemsForLIst(
          expenseItems: expenses[index],
        );
      },
    );
  }
}
