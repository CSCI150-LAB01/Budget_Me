import 'package:budgetme_flutter/screens/Questions/q2_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class q1 extends StatefulWidget {
  const q1({Key? key}) : super(key: key);

  @override
  _q1 createState() => _q1();
}

class _q1 extends State<q1> {
  final db = FirebaseFirestore.instance;
  final incomeController = TextEditingController();
  //space for stuffs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'A few steps to complete registration',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ), //Buffer spaces
                const Text(
                  "What's your monthly income?",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    labelText: 'Nearest Whole Number',
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  onChanged: (value) {
                    incomeController.text = value;
                  },
                ), //Buffer spaces
                const SizedBox(
                  height: 320,
                ),
                confirmButton(context, () {
                  String incomeString = incomeController.text;
                  RegExp regExp = RegExp(r'^\d*\.?\d+$');

                  if (regExp.hasMatch(incomeString)) {
                    double income = double.parse(incomeString);
                    db
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      'email': FirebaseAuth.instance.currentUser!.email,
                      'name': FirebaseAuth.instance.currentUser!.displayName,
                      'income': income,
                    });
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => q2()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Invalid Input"),
                          content: const Text(
                              "Please enter a valid number for income."),
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
                  }
                }), // End of confirmButton
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    incomeController.dispose();
    super.dispose();
  }
}
