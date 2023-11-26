// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/updatebudget_screen.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/widgets/bar_graph.dart';
import 'package:budgetme_flutter/screens/Pages/home_page.dart';
import 'package:budgetme_flutter/screens/Pages/UpdateBudget_page.dart';
import 'package:budgetme_flutter/screens/Pages/updateIncome_page.dart';
import 'package:budgetme_flutter/screens/Pages/profile_page.dart';
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

  int _currentIndex = 0;
  final screens = [
    HomePage(),
    UpdateBudgetPage(),
    UpdateIncomePage(),
    ProfilePage(),
  ];
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      extendBodyBehindAppBar: true,
     
      body: screens[_currentIndex],
      /*
      body: Container(//body:tabs[_currentIndex],
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
              
              SizedBox(
                height: 250,
                child: MyBarGraph(monthlyExpenses: monthlyExpenses, monthlyBudget: monthlyBudget,),
                
              ),
              
              const SizedBox(height: 10,),
               

              Column(
                children: <Widget>[
                //color: Colors.white,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBox3(
                          "Remaining Balance:",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBoxPos(
                          "10,000"
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBox3(
                          "Remaining Monthly Budget: ",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBoxPos(
                          "5,000"
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBox3(
                          "Remaining Rent Budget:",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBoxNeg(
                          "-100"
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBox3(
                          "Remaining Car Budget:",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBoxNeg(
                          "-22"
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBox3(
                          "Remaining Pet Budget:",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: textBoxNeg(
                          "-20"
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              ),
//------------------------------------------------------------------------------------------------------------------------------------
              /*
              const SizedBox(height: 10,),
              updateButton(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateBudgetScreen()));
                }), //confirm butto
                */
            ]
            ),
          ),
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label:'Update Budget',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Update Income',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }

}
