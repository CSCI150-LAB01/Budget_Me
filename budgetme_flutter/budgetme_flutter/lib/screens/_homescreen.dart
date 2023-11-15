import 'package:budgetme_flutter/widgets/navbar.dart';
import 'package:flutter/material.dart';

class _TransactionPage extends StatefulWidget {
  const _TransactionPage({super.key});

  @override
  State<_TransactionPage> createState() => __TransactionPageState();
}

class __TransactionPageState extends State<_TransactionPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
