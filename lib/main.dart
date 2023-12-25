import 'package:flutter/material.dart';

import 'lib/widgets/expenses_mainlistscreen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpensesMainListScreen();
  }
}
