import 'package:budgetme_flutter/screens/Questions/q4_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:flutter/material.dart';

class q3 extends StatefulWidget {
  const q3({Key? key}) : super(key: key);

  @override
  _q3 createState() => _q3();
}

class _q3 extends State<q3> {
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
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ), //Buffer spaces
                questions("Do you have a car payment?"),
                const SizedBox(
                  height: 30,
                ), //Buffer spaces
                confirmButton(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => q4()));
                }) //confirm button
              ]
            ),
          ),
      ),
      
    ),
    );
  }
}