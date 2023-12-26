// expenses_list.dart
import 'package:flutter/material.dart';

import '../../Expense Model/expense_model.dart';
import 'expense_items_for_list.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {Key? key, required this.expenses, required this.removeExData})
      : super(key: key);
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expenseModel) removeExData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            removeExData(expenses[index]);
          },
          child: ExpenseItemsForList(
            expenseItems: expenses[index],
          ),
        );
      },
    );
  }
}
