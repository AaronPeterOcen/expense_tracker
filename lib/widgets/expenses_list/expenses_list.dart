import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
// Expense

// FlutterError

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // Build a ListView using ListView.builder
    return ListView.builder(
      // Set the number of items in the list to the length of the expenses list
      itemCount: expenses.length,
      // Define how each item in the list should be built
      itemBuilder: (ctx, index) =>
          // Create a Text widget to display the title of each expense
          ExpensesItem(expenses[index]
              // Access the title property of the expense at the current index
              ),
    );
  }
}
