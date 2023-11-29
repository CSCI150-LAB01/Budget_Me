import 'package:budgetme_flutter/widgets/piechart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionPage extends StatefulWidget {
  final Function(List<Color>) onColorsShuffled;

  const TransactionPage({
    Key? key,
    required this.onColorsShuffled,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // Define a list of test expenses
  List<Map<String, dynamic>> expenses = [
    {
      'name': 'UX essential training',
      'date': 'Jun 30, 2019',
      'amount': -150.00,
      'categoryIcon': Icons.pie_chart_outline,
      'categoryColor': Colors
          .brown, // Assuming brown corresponds to a category color in your pie chart
    },
    {
      'name': 'UI patterns for beginners',
      'date': 'Jun 29, 2019',
      'amount': -150.00,
      'categoryIcon': Icons.web,
      'categoryColor': Colors
          .blue, // Assuming blue corresponds to a category color in your pie chart
    },
    // Add more test expenses as needed
  ];

  @override
  Widget build(BuildContext context) {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      return const Text("No user logged in");
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: [
            // Top grey circle
            Positioned(
              top: 50, // Adjust as needed
              left: 20,
              right: 20,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.4, // 40% of the screen height
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Grey with opacity
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(500),
                    topRight: Radius.circular(500),
                    bottomLeft: Radius.circular(500), // Adjust as needed
                    bottomRight: Radius.circular(500), // Adjust as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
                  child: Center(
                    child: MyPieChart(
                      userId: userId,
                      onColorsShuffled: widget.onColorsShuffled,
                    ),
                  ),
                ), // Add child content inside this container as needed
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              left: 0,
              right: 0,
              bottom: 45,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Transaction History'
                            .toUpperCase(), // Small caps effect by converting to uppercase
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ), // Adjust the size as needed
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: expenses.length, // Your list of expenses
                        itemBuilder: (context, index) {
                          final expense =
                              expenses[index]; // Single expense item
                          return ListTile(
                            leading: Icon(
                              expense['categoryIcon'], // Icon for the category
                              color: expense[
                                  'categoryColor'], // Color for the category
                            ),
                            title: Text(
                              expense['name'], // Name of the expense
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Adjust the size as needed
                                ),
                              ),
                            ),
                            subtitle: Text(
                              expense['date'], // Date of the expense
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 16, // Adjust the size as needed
                                ),
                              ),
                            ),
                            trailing: Text(
                              expense['amount'].toString(),
                              style: GoogleFonts.lato(
                                color: expense['amount'] < 0
                                    ? Colors.red
                                    : Colors.black, // Expense amount color
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Adjust the size as needed
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add more Positioned widgets as needed
          ],
        ),
      ),
    );
  }
}
