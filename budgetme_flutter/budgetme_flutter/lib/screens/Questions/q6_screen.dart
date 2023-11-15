import 'package:budgetme_flutter/screens/Questions/q7_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:flutter/material.dart';

class q6 extends StatefulWidget {
  const q6({Key? key}) : super(key: key);

  @override
  _q6 createState() => _q6();
}

class _q6 extends State<q6> {
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
                questions("How much do you spend on transportation?"),
                const SizedBox(
                  height: 30,
                ), //Buffer spaces
                confirmButton(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => q7()));
                }) //confirm button
              ]
            ),
          ),
      ),
      
    ),
    );
  }
}