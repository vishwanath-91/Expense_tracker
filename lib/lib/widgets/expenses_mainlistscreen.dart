import 'package:expenses_tracker_app/lib/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../Expense Model/expense_model.dart';
import 'new_expense.dart';

class ExpensesMainListScreen extends StatefulWidget {
  const ExpensesMainListScreen({super.key});

  @override
  State<ExpensesMainListScreen> createState() => _ExpensesMainListScreenState();
}

class _ExpensesMainListScreenState extends State<ExpensesMainListScreen> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
        title: 'cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NewExpenseAdd(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense List"), actions: [
        IconButton(
            onPressed: () => _openAddExpenseOverlay(),
            icon: const Icon(Icons.add))
      ]),
      body: SafeArea(
          child: Column(children: [
        Expanded(child: ExpenseList(expenses: _registeredExpenses))
      ])),
    );
  }
}
