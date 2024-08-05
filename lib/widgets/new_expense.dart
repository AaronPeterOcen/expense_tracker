import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  // Alternative method
  // Create a TextEditingController to manage the text input
  final _textInputController = TextEditingController();
  final _amountInputController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the TextEditingController when the widget is disposed
    _textInputController.dispose();
    _amountInputController.dispose();
    // Call the dispose method of the superclass
    super.dispose();
  }

  void _enterDate() {
    // Get the current date and time
    final now = DateTime.now();

    // Calculate the date one year before today
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    // Show a date picker dialog
    showDatePicker(
      context: context, // The BuildContext to use for the dialog
      initialDate:
          now, // The initial date to display in the picker (today's date)
      firstDate:
          firstDate, // The earliest selectable date (one year before today)
      lastDate: now, // The latest selectable date (today's date)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _textInputController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountInputController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Select Date'),
                    IconButton(
                      onPressed: _enterDate,
                      icon: const Icon(Icons.date_range_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_textInputController.text);
                  print(_amountInputController.text);
                },
                child: const Text('Save Expense'),
              ),
              TextButton(
                onPressed: () {
                  // using navigator.pop to close the modal manually
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
