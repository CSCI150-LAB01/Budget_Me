import 'package:budgetme_flutter/screens/Questions/q2_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:flutter/material.dart';

class q1 extends StatefulWidget {
  const q1({Key? key}) : super(key: key);

  @override
  _q1 createState() => _q1();
}

class _q1 extends State<q1> {
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
              questions("Whats your monthly income?"),
              const SizedBox(
                height: 30,
              ), //Buffer spaces
              confirmButton(context, () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => q2()));
              }) //confirm button
            ]),
          ),
        ),
      ),
    );
  }
}
