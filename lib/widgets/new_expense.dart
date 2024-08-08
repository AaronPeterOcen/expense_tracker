// import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    // Dispose of the TextEditingController when the widget is disposed
    _textInputController.dispose();
    _amountInputController.dispose();
    // Call the dispose method of the superclass
    super.dispose();
  }

  void _enterDate() async {
    // Get the current date and time
    final now = DateTime.now();
    // Calculate the date one year before today
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // Show a date picker dialog
    final pickedDate = await showDatePicker(
      context: context, // The BuildContext to use for the dialog
      initialDate:
          now, // The initial date to display in the picker (today's date)
      firstDate:
          firstDate, // The earliest selectable date (one year before today)
      lastDate: now, // The latest selectable date (today's date)
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountInputController.text);
    final isAmountValid = enteredAmount == null || enteredAmount <= 0;
    if (_textInputController.text.trim().isEmpty ||
        isAmountValid ||
        _selectedDate == null) {
      // showCupertinoDialog(
      //   context: context,
      //   builder: (ctc) => CupertinoAlertDialog(
      //     title: const Text(
      //       'Wrong Input',
      //       style: TextStyle(
      //           fontWeight: FontWeight.w600,
      //           color: Color.fromARGB(255, 26, 122, 29)),
      //     ),
      //     content: const Text(
      //         'Please make sure you entered the required information'),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.pop(ctx);
      //         },
      //         child: Text('Continue'),
      //       ),
      //     ],
      //   ),
      // );

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Wrong Input',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 26, 122, 29)),
          ),
          content: const Text(
            'Please make sure you entered the required information',
            style: TextStyle(
                // color: Color.fromARGB(255, 32, 81, 33),
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          title: _textInputController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpaceValue = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      //  widget that uses a builder function to build its child based on the parent widget's constraints.

      // Using the constraints to get the available width and height
      final availableWidth = constraints.maxWidth;
      // final availableHeight = constraints.maxHeight;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyBoardSpaceValue + 16),
            child: Column(
              children: [
                if (availableWidth >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textInputController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
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
                    ],
                  )
                else
                  TextField(
                    controller: _textInputController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (availableWidth >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        // dropdownColor: TextStyle(),
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'No Date Selected'
                                  : dateFormatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _enterDate,
                              icon: const Icon(Icons.date_range_outlined),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                else
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
                            Text(
                              _selectedDate == null
                                  ? 'No Date Selected'
                                  : dateFormatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _enterDate,
                              icon: const Icon(Icons.date_range_outlined),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (availableWidth >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
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
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        // dropdownColor: TextStyle(),
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
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
          ),
        ),
      );
    });
  }
}
