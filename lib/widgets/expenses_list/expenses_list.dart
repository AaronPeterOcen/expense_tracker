import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
// Expense

// FlutterError

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // Build a ListView using ListView.builder
    return ListView.builder(
      // Set the number of items in the list to the length of the expenses list
      itemCount: expenses.length,
      // Define how each item in the list should be built
      itemBuilder: (ctx, index) =>
          // Create a Text widget to display the title of each expense
          Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withGreen(220),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpensesItem(
          expenses[index],
          // Access the title property of the expense at the current index
        ),
      ),
    );
  }
}
