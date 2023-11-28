import 'package:budgetme_flutter/screens/Questions/q4_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class q3 extends StatefulWidget {
  const q3({Key? key}) : super(key: key);

  @override
  _q3 createState() => _q3();
}

class _q3 extends State<q3> {
  final db = FirebaseFirestore.instance;
  final q3controller = TextEditingController();
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
                "Do You Pay Off a Vehicle?",
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
                  labelText: 'Enter Vehicle Payment Here',
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
                  q3controller.text = value;
                },
              ), //Buffer spaces
              confirmButton(context, () {
                String car = q3controller.text;
                db
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({'car': car}, SetOptions(merge: true)); //here
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const q4()));
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
    q3controller.dispose();
  }
}
