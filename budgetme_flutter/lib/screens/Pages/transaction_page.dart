import 'package:budgetme_flutter/widgets/piechart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  final Function(Map<String, Color>) onColorsShuffled;

  const TransactionPage({
    Key? key,
    required this.onColorsShuffled,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  // Define a list of test expenses
  Stream<List<Map<String, dynamic>>> getUserExpenses() {
    return firestore
        .collection('expenses')
        .where('userId', isEqualTo: user?.uid)
        .orderBy('timestamp',
            descending: true) // Change to false if you want ascending order
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Text("No user logged in");
    }

    // Rest of your build method...
    // Replace your ListView.builder with the following StreamBuilder

    Expanded(
      child: StreamBuilder<List<Map<String, dynamic>>>(
        stream: getUserExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.error != null) {
            // Handle errors
            return Text('Something went wrong');
          }
          final expenses = snapshot.data ?? [];
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                leading: const Icon(
                  // You will need to map your categories to icons
                  Icons.category, // Placeholder icon, replace with your logic
                  color:
                      Colors.blue, // Placeholder color, replace with your logic
                ),
                title: Text(
                  expense['name'],
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                subtitle: Text(
                  // Format the date as needed
                  DateFormat('MMM dd, yyyy')
                      .format(expense['timestamp'].toDate()),
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: Text(
                  '\$${expense['amount'].toStringAsFixed(2)}',
                  style: GoogleFonts.lato(
                    color: expense['amount'] < 0 ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
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
                      userId: FirebaseAuth.instance.currentUser!.uid,
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
              bottom: 35,
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
                      child: StreamBuilder<List<Map<String, dynamic>>>(
                        stream: getUserExpenses(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.error != null) {
                            return Text('$snapshot.error');
                          }
                          final expenses = snapshot.data ??
                              []; // Correct scope for 'expenses'
                          return ListView.builder(
                            itemCount: expenses.length,
                            itemBuilder: (context, index) {
                              final expense = expenses[index];
                              return ListTile(
                                leading: const Icon(
                                  Icons
                                      .category, // Placeholder icon, replace with your logic
                                  color: Colors
                                      .blue, // Placeholder color, replace with your logic
                                ),
                                title: Text(
                                  expense['name'],
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  DateFormat('MMM dd, yyyy').format(expense[
                                          'timestamp']
                                      .toDate()), // Correct usage of DateFormat
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                trailing: Text(
                                  '\$${expense['amount'].toStringAsFixed(2)}',
                                  style: GoogleFonts.lato(
                                    color: expense['amount'] < 0
                                        ? Colors.red
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
