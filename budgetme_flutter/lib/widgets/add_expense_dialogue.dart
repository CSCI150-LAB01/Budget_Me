import 'package:flutter/material.dart';

// This is just a function, not a widget.
void showAddExpenseDialog(BuildContext context, List<Color> shuffledColors) {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? selectedCategory;

  // List of categories
  // Mapping categories to icons
  Map<String, IconData> categoryIcons = {
    'Vehicle': Icons.directions_car,
    'Other': Icons.more_horiz,
    'Groceries': Icons.local_grocery_store,
    'Leisure': Icons.sports_esports,
    'Loans': Icons.attach_money,
    'Necessary': Icons.check_box,
    'Housing': Icons.home,
    'Transportation': Icons.directions_bus,
  };

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Add Expense'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Type name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Category',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 10.0, // gap between adjacent chips
                    runSpacing: 10.0, // gap between lines
                    children: categoryIcons.keys.map((String key) {
                      return ChoiceChip(
                        label: Text(key),
                        selected: selectedCategory == key,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = selected ? key : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Budget',
                      hintText: 'Type amount',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
              ),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  // Logic to save the expense
                  // Here you can call a function to save the data to Firestore
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
              ),
            ],
          );
        },
      );
    },
  );
}
