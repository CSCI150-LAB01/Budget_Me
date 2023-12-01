import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/global.dart';

void showAddExpenseDialog(
    BuildContext context, Map<String, Color> categoryColors) {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  // ignore: unused_local_variable
  final db = FirebaseFirestore.instance;
  String? selectedCategory;

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
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: categoryIcons.keys.map((String key) {
                      Color chipColor = color_Map[key] ?? Colors.grey;
                      return ChoiceChip(
                        label: Text(key),
                        selected: selectedCategory == key,
                        selectedColor: chipColor,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = selected ? key : null;
                          });
                        },
                        backgroundColor: chipColor.withAlpha(50),
                        labelStyle: TextStyle(
                          color: selectedCategory == key
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Type amount',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
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
                onPressed: () async {
                  if (selectedCategory == null ||
                      nameController.text.isEmpty ||
                      amountController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Please fill all fields."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  double amount = double.tryParse(amountController.text) ?? 0;
                  String userId = FirebaseAuth.instance.currentUser!.uid;

                  Map<String, dynamic> expenseData = {
                    'name': nameController.text,
                    'amount': amount,
                    'category': selectedCategory,
                    'timestamp': FieldValue.serverTimestamp(),
                    'userId': userId,
                  };

                  try {
                    await FirebaseFirestore.instance
                        .collection('expenses')
                        .add(expenseData);
                  } catch (e) {
                    rethrow;
                    // Handle the error, maybe show an error message
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context)
                      .pop(); // Dismiss the dialog after adding the expense
                },
              ),
            ],
          );
        },
      );
    },
  );
}
