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
        title: const Text('Answer The Following',
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
              questions("Whats your monthly income?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Do you pay rent/mortgage?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Do you have a car payment?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Do you have any loans/credit card payments?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("How much do you spend on groceries?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("How much do you spend on transportation?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("Other NECESSARY spending?"),
              //Add a text field above to demonstarte how we want them to respond
              const SizedBox(height:30,),//Buffer spaces
              questions("How much do you hope to save per month?"),
              const SizedBox(height:30,),//Buffer spaces
              questions("How much do you spend on leisure per month?"),
              //End of Questions
              const SizedBox(height:30,),//Buffer spaces
              confirmButton(context, (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              })//confirm button
            ],
          ),
        ),
      ),
    ),
    );
  }
}