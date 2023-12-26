// expenses_main_list_screen.dart
import 'package:flutter/material.dart';

import '../Expense Model/expense_model.dart';
import 'expenses_list/expenses_list.dart';
import 'new_expense.dart';

class ExpensesMainListScreen extends StatefulWidget {
  const ExpensesMainListScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesMainListScreen> createState() => _ExpensesMainListScreenState();
}

class _ExpensesMainListScreenState extends State<ExpensesMainListScreen> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpenseAdd(onAddExpense: _addExpenseData),
    );
  }

  void _addExpenseData(ExpenseModel expenseModel) {
    setState(() {
      _registeredExpenses.add(expenseModel);
    });
  }

  void _removeExpenseData(ExpenseModel expenseModel) {
    setState(() {
      _registeredExpenses.remove(expenseModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense List'),
        actions: [
          IconButton(
            onPressed: () => _openAddExpenseOverlay(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ExpenseList(
                  expenses: _registeredExpenses,
                  removeExData: _removeExpenseData),
            ),
          ],
        ),
      ),
    );
  }
}
