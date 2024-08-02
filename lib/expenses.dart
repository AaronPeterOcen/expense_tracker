import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

// FlutterError

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'foodies',
      amount: 10.30,
      date: DateTime.timestamp(),
      category: Category.food,
    ),
    Expense(
      title: 'movies',
      amount: 5.0,
      date: DateTime.now(),
      category: Category.outing,
    )
  ];

  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Expenses Tracker'),
          Text('initial Setup Tracker'),
        ],
      ),
    );
  }
}
