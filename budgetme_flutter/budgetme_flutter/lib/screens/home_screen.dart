import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
/*
class CardOne extends StatelessWidget {
  const CardOne({
    super.key, required this.color,
  });
}
*/

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Welcome to your Budget',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Here is your Budget!...",
                style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 24),
              ),
              const SizedBox(height: 30,),
               Text("Balance- ",
                style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),
              ),
               Text("1,000,000,000 ",
                style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 50),
              ),

              Container(
                color: Colors.white,
                child: Row(
                  children: [
                      Column(
                        children:[
                          Container(),
                        Text("Budget Remaining- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Total Spent- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Allocation for ...- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Allocation for ...- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Allocation for ...- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("Allocation for ...- ",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 100,),
                        ]
              //Add the Budget Visuals Here
                    ),
                ]),
              ),
//------------------------------------------------------------------------------------------------------------------------------------
              const SizedBox(height: 200,),
              updateButton(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateBudgetScreen()));
                }) //confirm button
            ]
            ),
          ),
        ),
      ),
    );
  }
}
