// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Update Budget',
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
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
