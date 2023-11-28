import 'package:budgetme_flutter/screens/Questions/q8_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class q7 extends StatefulWidget {
  const q7({Key? key}) : super(key: key);

  @override
  _q7 createState() => _q7();
}

class _q7 extends State<q7> {
  final db = FirebaseFirestore.instance;
  final q7controller = TextEditingController();
  //space for stuffs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Answer The Following',
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 30,
              ), //Buffer spaces
              const Text(
                "Any Other NECESSARY Spending",
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
                  labelText: 'Purchases to Live',
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
                  q7controller.text = value;
                },
              ), //Buffer spaces
              confirmButton(context, () {
                String necessary = q7controller.text;
                if (necessary == "") {
                  necessary = '0';
                }
                db
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({'necessary': necessary},
                        SetOptions(merge: true)); //here
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const q8()));
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
    q7controller.dispose();
  }
}
