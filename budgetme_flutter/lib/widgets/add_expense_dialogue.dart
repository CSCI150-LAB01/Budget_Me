import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/global.dart';

// This is just a function, not a widget.
void showAddExpenseDialog(
    BuildContext context, Map<String, Color> categoryColors) {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? selectedCategory;

  // List of categories
  // Mapping categories to icons
  Map<String, IconData> categoryIcons = {
    'car': Icons.directions_car,
    'additional': Icons.more_horiz,
    'groceries': Icons.local_grocery_store,
    'leisure': Icons.sports_esports,
    'loans': Icons.attach_money,
    'necessary': Icons.check_box,
    'rent': Icons.home,
    'transport': Icons.directions_bus,
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
                    spacing: 10.0, // Gap between adjacent chips
                    runSpacing: 10.0, // Gap between lines
                    children: categoryIcons.keys.map((String key) {
                      Color chipColor = color_Map[key] ?? Colors.grey;
                      return ChoiceChip(
                        label: Text(key),
                        selected: selectedCategory == key,
                        selectedColor: chipColor, // Use the color from the map
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = selected ? key : null;
                          });
                        },
                        backgroundColor: chipColor
                            .withAlpha(50), // Lighter shade for unselected
                        labelStyle: TextStyle(
                            color: selectedCategory == key
                                ? Colors.white
                                : Colors.black),
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
