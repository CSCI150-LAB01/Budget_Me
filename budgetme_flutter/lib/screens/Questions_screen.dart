import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';



class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreen createState() => _QuestionsScreen();

}

class _QuestionsScreen extends State<QuestionsScreen> {
  //space for stuffs
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: const Text('First Join Questioneer',
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
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 1"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 2"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 3"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 4"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 5"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 6"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 7"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 8"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 9"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Question 10"),
            ],
          ),
        ),
      ),
    ),
    );
  }
}