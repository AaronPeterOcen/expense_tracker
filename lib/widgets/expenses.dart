import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
    // Expense(
    //   title: 'movies',
    //   amount: 5.0,
    //   date: DateTime.now(),
    //   category: Category.outing,
    // )
  ];

  void _openExpenseAdd() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    // Show a SnackBar using the ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(
      // Create a SnackBar widget
      SnackBar(
        // Set the duration for how long the SnackBar will be visible
        duration: const Duration(seconds: 3),
        // Set the content of the SnackBar to display a message
        content: const Text('Input Deleted'),
        // Add an action button to the SnackBar
        action: SnackBarAction(
          // Label for the action button
          label: 'Undo',
          // Callback function to be executed when the action button is pressed
          onPressed: () {
            // Use setState to update the UI
            setState(() {
              // Insert the previously deleted expense back into the list at its original index
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No items found, try adding an Expense'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
      // return mainContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openExpenseAdd,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: expenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
