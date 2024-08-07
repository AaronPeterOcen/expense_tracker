import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

// Define an enumeration named Category to represent various expense categories.
// Enumeration values representing different categories
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.flight_outlined,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.laptop_chromebook_outlined,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      // Initialize the id property with a unique value generated by uuid.v4()
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

// Define the ExpenseBucket class
class ExpenseBucket {
  // Constructor for the ExpenseBucket class
  const ExpenseBucket({
    required this.category, // Required parameter for the expense category
    required this.expenses, // Required parameter for the list of expenses
  });

// Define a named constructor for the ExpenseBucket class to filter expenses by category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      // Initialize the expenses property by filtering the allExpenses list
      : expenses = allExpenses
            // Use the where method to filter expenses that match the category
            .where((expense) => expense.category == category)
            // Convert the filtered iterable to a list
            .toList();

  // Property to store the category of the expenses
  final Category category;

  // Property to store the list of expenses
  final List<Expense> expenses;

  // Getter to calculate the total amount of expenses in the bucket
  double get totalExpenses {
    // Initialize the sum variable to 0
    double sum = 0;

    // Iterate through each expense in the expenses list
    for (final expense in expenses) {
      // Add the amount of the current expense to the sum
      sum += expense.amount;
    }

    // Return the total sum of the expenses
    return sum;
  }
}
