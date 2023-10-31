import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/screens/signup_screen.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        title: const Text('Welcome to your Budget',
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
              Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                child: ElevatedButton(   
                    onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateBudgetScreen())
                        );//push
                    }, //onPressed
                  child: const Text('Update Budget'),
                  ),
                  ),
              ),
              
            ],
          ),
        ),
      ),
    ),
    );
  }
}
