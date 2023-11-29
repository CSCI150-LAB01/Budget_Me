import 'package:budgetme_flutter/screens/Pages/transaction_page.dart';
import 'package:budgetme_flutter/widgets/add_expense_dialogue.dart';
import 'package:budgetme_flutter/widgets/piechart.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:budgetme_flutter/screens/Pages/profile_page.dart';
import 'package:budgetme_flutter/main.dart';


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
  Map<String, Color> categoryColors = {};
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    // Initialize the screens array here
    screens = [
      TransactionPage(onColorsShuffled: (Map<String, Color> colors) {
        onColorsShuffled(colors);
      }),
      const ProfilePage(),
    ];
  }

  void onColorsShuffled(Map<String, Color> colors) {
    setState(() {
      categoryColors = colors;
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double fabSize = 58; // Standard FAB size
    double fabMargin = fabSize / 1.8; // Half the FAB size

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        leading: Navigator.of(context).canPop() ? null : IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          
        ),
      extendBody: true,
      body: screens[_currentIndex],
      floatingActionButton: Container(
        height: fabSize,
        width: 56,
        margin: EdgeInsets.only(top: fabMargin), // Aligns FAB with BottomAppBar
        decoration: BoxDecoration(
          color: Colors.grey[300], // Match BottomAppBar color
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () => showAddExpenseDialog(context, categoryColors),
          elevation: 0,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add), // Adjust FAB color if necessary
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300], // Match FAB background color
        shape: const CircularNotchedRectangle(),
        notchMargin: 0, // Set this to zero for seamless blending
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ), // This will create the necessary spacing
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
