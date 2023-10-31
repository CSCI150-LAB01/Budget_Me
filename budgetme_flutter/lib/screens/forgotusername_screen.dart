import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';



class ForgotUsernameScreen extends StatefulWidget {
  const ForgotUsernameScreen({Key? key}) : super(key: key);

  @override
  _ForgotUsernameScreen createState() => _ForgotUsernameScreen();

}

class _ForgotUsernameScreen extends State<ForgotUsernameScreen> {
  //space for stuffs
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: const Text('Forgot Username',
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
              
              
            ],
          ),
        ),
      ),
    ),
    );
  }
}