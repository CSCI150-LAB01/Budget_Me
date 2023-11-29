import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InputExpensesPage extends StatefulWidget {
  const InputExpensesPage({Key? key}) : super(key: key);

  @override
  _InputExpensesPage createState() => _InputExpensesPage();
}

class _InputExpensesPage extends State<InputExpensesPage> {
  //space for stuffs
  final db = FirebaseFirestore.instance;
  final incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Input Expenses',
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
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
         
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
            children: <Widget>[
              const SizedBox(height: 0,),
              //----------------------Start of Actual viewables--------------

              const Text("Provide some info about Your Expenses...",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50,),
              ///////////////////////////// 1st text field/////////////////////////////////////////

                  const Text("Category of Expence",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      labelText: 'No Spaces|No Caps',
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
                      incomeController.text = value;
                    },
                  ), //Buffer spaces
                  
                  const SizedBox(height: 30,),
                  
                  ///////////////////////// 2nd text field////////////////////////////////////////////
                  
                  const Text("Amount",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      labelText: 'Nearest Whole Number',
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
                      incomeController.text = value;
                    },
                  ), //Buffer spaces
                  const SizedBox(height: 30,),

            ],),
        ),
      ),
      ),
      ),
    );
  }



  @override
  void dispose() {
    super.dispose();
    incomeController.dispose();
  }
}


