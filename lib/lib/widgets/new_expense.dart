import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Expense Model/expense_model.dart';

final formatter = DateFormat.yMd();

class NewExpenseAdd extends StatefulWidget {
  const NewExpenseAdd({
    Key? key,
    required this.onAddExpense,
  }) : super(key: key);

  final void Function(ExpenseModel expenseModel) onAddExpense;

  @override
  State<NewExpenseAdd> createState() => _NewExpenseAddState();
}

class _NewExpenseAddState extends State<NewExpenseAdd> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  late double amountCon;
  DateTime? _selectedDate;
  Category selectedCategory = Category.food;

  Future<void> _presentDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year, initialDate.month - 2, initialDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _validateExpenseData() {
    if (_titleController.text.trim().isEmpty) {
      _showErrorDialog('Invalid Title', 'Please make sure a valid title');
    } else if (_amountController.text.trim().isEmpty) {
      _showErrorDialog('Invalid Amount', 'Please make sure a valid amount');
    } else if (_selectedDate == null) {
      _showErrorDialog('Invalid Date', 'Please select a valid date');
    } else {
      _saveExpenseData();
    }
  }

  void _saveExpenseData() {
    setState(() {
      amountCon = double.tryParse(_amountController.text) ?? 0.0;
    });

    widget.onAddExpense(
      ExpenseModel(
        title: _titleController.text,
        amount: amountCon,
        date: _selectedDate!,
        category: selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: () => _presentDatePicker(),
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton<Category>(
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem<Category>(
                        value: category,
                        child: Row(
                          children: [
                            Icon(categoryIcons[category]!),
                            const SizedBox(width: 8),
                            Text(category.toString().toUpperCase()),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (Category? value) {
                  if (value != null) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }
                },
                value: selectedCategory,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _validateExpenseData();
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
