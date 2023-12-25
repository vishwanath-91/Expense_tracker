import 'package:flutter/material.dart';

class NewExpenseAdd extends StatefulWidget {
  const NewExpenseAdd({super.key});

  @override
  State<NewExpenseAdd> createState() => _NewExpenseAddState();
}

class _NewExpenseAddState extends State<NewExpenseAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextFormField()],
    );
  }
}
