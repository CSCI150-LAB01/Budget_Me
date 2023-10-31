import 'package:budgetme_flutter/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/home_screen.dart';
import 'package:budgetme_flutter/screens/signup_screen.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';

class UpdateBudgetScreen extends StatefulWidget {
  const UpdateBudgetScreen({Key? key}) : super(key: key);

  @override
  _UpdateBudgetScreen createState() => _UpdateBudgetScreen();

}

class _UpdateBudgetScreen extends State<UpdateBudgetScreen> {
  //space for stuffs
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: const Text('Update Budget',
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Placeholder for Budget', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0) //Sets how square outline of budget is
                    )
                  
                  ),
              ),
              Container(

                height: 50,
                width: 100,
                decoration: BoxDecoration(color: Colors.transparent,
              
                ),
                child:
                  ElevatedButton(
                    child: Text(
                      "Update Budget",
                      //style: TextStyle(color: Colors.black, fontSize: 25) //to change color of text
                      ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value){
                        print("Signed out");
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateBudgetScreen()) //When a update page is created update this
                        );//push
                      }); // then
                    }, //onPressed
                  )
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}