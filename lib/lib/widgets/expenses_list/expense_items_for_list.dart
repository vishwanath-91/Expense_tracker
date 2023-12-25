import 'package:flutter/material.dart';

import '../../Expense Model/expense_model.dart';

class ExpenseItemsForLIst extends StatelessWidget {
  const ExpenseItemsForLIst({
    super.key,
    required this.expenseItems,
  });

  final ExpenseModel expenseItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: const Color.fromRGBO(5, 24, 45, 0.5),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              expenseItems.title.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('\$ ${expenseItems.amount}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.alarm),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(expenseItems.formatDate),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
