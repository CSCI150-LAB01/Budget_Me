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
              /////////////////////////// UPDATE INCOME BUTTON ////////////////////////////
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateBudgetScreen())
                );//push
                },//onPressed
                //---------------------- Button Style ----------------------------
                child: const Text('Update Income',
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return Colors.white;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                    //------------------------------------------------------------
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 50),
              ///////////////// UPDATE EXPENSES BUTTON ///////////////////////////////////
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateBudgetScreen())
                    );//push
                  },//onPressed
                  //---------------------- Button Style ----------------------------
                  child: const Text('Update Expenses',
                  style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return Colors.white;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                    //------------------------------------------------------------
                ),
                ),
                /////////////////////////////////////////////////////////////////////////
              
            ],
          ),
        ),
      ),
    ),
    );
  }
}