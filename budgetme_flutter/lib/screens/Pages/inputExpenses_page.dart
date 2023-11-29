import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputExpensesPage extends StatefulWidget {
  const InputExpensesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: [
             Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 200,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                      
                  child: Column(
                    children: <Widget>[                 
                      Text(
                        'Edit Expenses'
                            .toUpperCase(), // Small caps effect by converting to uppercase
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ), // Adjust the size as needed
                        ),),
                      const Text("data",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                      ),
                    Wrap(
                      children: List.generate(3, (index) => Text("Placeholder"))
                    ),


                    ],
                  ),
                ),
              ),
            ),
          ],
            /*
            child: Container(
              decoration:  const BoxDecoration(
                color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20), // Adjust as needed
                    bottomRight: Radius.circular(20),
                  ),
              ),
              child: Column(
                
                children: <Widget>[
                  const SizedBox(
                    height: 0,
                  ),
                  //----------------------Start of Actual viewables--------------

                  const Text(
                    "Select Your category...",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    updateButton(context, (){})
                  ],),
                  const SizedBox(
                    height: 50,
                  ),

                  ///////////////////////////// 1st text field/////////////////////////////////////////

                  const Text(
                    "Category of Expence",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  
                  const SizedBox(
                    height: 30,
                  ),

                  ///////////////////////// 2nd text field////////////////////////////////////////////

                  const Text(
                    "Amount",
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
                    style: TextStyle(color: Colors.black.withOpacity(0.9)),
                    decoration: InputDecoration(
                      labelText: 'Nearest Whole Number',
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                    onChanged: (value) {
                      incomeController.text = value;
                    },
                  ), //Buffer spaces
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            */
          ),
      //  ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    incomeController.dispose();
  }
}
