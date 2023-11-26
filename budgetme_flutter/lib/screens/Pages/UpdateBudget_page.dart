import 'package:flutter/material.dart';

class UpdateBudgetPage extends StatefulWidget {
  const UpdateBudgetPage({Key? key}) : super(key: key);

  @override
  _UpdateBudgetPage createState() => _UpdateBudgetPage();
}

class _UpdateBudgetPage extends State<UpdateBudgetPage> {
  //space for stuffs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Update Budget',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}