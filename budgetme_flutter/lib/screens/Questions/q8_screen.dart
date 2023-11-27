import 'package:budgetme_flutter/screens/Questions/q9_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:flutter/material.dart';

class q8 extends StatefulWidget {
  const q8({Key? key}) : super(key: key);

  @override
  _q8 createState() => _q8();
}

class _q8 extends State<q8> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textBox2("8 of 10 Questions"),
                const SizedBox(
                  height: 30,
                ), //Buffer spaces
                const Text(
                "How much do you hope to save per month?",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
                questions("Nearest Whole Number"),
                const SizedBox(
                  height: 330,
                ), //Buffer spaces
                confirmButton(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => q9()));
                }) //confirm button
              ]
            ),
          ),
      ),
      
    ),
    );
  }
}