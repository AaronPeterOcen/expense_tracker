import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var lColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 27, 237, 111));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: lColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: lColorScheme.onPrimaryContainer,
            foregroundColor: lColorScheme.onPrimary),
      ),
      home: const Expenses(),
    );
  }
}
