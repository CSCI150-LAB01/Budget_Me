import 'package:budgetme_flutter/screens/Pages/inputExpenses_page.dart';
import 'package:budgetme_flutter/screens/Pages/transaction_page.dart';
import 'package:budgetme_flutter/widgets/add_expense_dialogue.dart';
import 'package:budgetme_flutter/widgets/piechart.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/Pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
  List<Color> shuffledColors = getShuffledColors();
  late List<Widget> screens; // Remove 'final' and 'const'

  @override
  void initState() {
    super.initState();
    // Initialize the screens array here
    screens = [
      TransactionPage(onColorsShuffled: onColorsShuffled),
      const InputExpensesPage(),
      const ProfilePage(),
    ];
  }

  void onColorsShuffled(List<Color> colors) {
    setState(() {
      shuffledColors = colors;
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double fabSize = 58; // Standard FAB size
    double fabMargin = fabSize / 1.8; // Half the FAB size

    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          backgroundColor: Colors.grey[300],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Input Expenses',
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
