// expense_items_for_list.dart
import 'package:flutter/material.dart';

import '../../Expense Model/expense_model.dart';

class ExpenseItemsForList extends StatelessWidget {
  const ExpenseItemsForList({
    Key? key,
    required this.expenseItems,
  }) : super(key: key);

  final ExpenseModel expenseItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
