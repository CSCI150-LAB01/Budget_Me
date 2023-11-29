import 'package:budgetme_flutter/screens/Questions/q3_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class q2 extends StatefulWidget {
  const q2({Key? key}) : super(key: key);

  @override
  _q2 createState() => _q2();
}

class _q2 extends State<q2> {
  final db = FirebaseFirestore.instance;
  final q2controller = TextEditingController();
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
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 30,
              ), //Buffer spaces
              const Text(
                "Do You Pay Rent or Mortgage?",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
                decoration: InputDecoration(
                  //prefixIcon: Icon(
                  //   icon,
                  //   color: Colors.white70,
                  // ),
                  labelText: 'Enter Rent Here',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                ),
                onChanged: (value) {
                  q2controller.text = value;
                },
              ), //Buffer spaces
              const SizedBox(
                height: 320,
              ),
              confirmButton(context, () {
                const Alignment(1, -1);
                String rent = q2controller.text;
                if (rent == "") {
                  rent = '0';
                }
                db
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({'rent': rent}, SetOptions(merge: true)); //here
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const q3()));
              }) //confirm button
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    q2controller.dispose();
  }
}
