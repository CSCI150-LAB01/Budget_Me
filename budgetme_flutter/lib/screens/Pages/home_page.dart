import 'package:flutter/material.dart';
import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:budgetme_flutter/widgets/bar_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<double> monthlyExpenses = [
    5000.0, //total Budgte
    1298.0, //monthlyIncome
    800.0, //rent
    378.0, //carPayment
    120.0, //pets
  ];
  List<double> monthlyBudget = [
    10000.0, //total Budgte
    5000.0, //monthlyIncome
    900.0, //rent
    350.0, //carPayment
    100.0, //pets
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Novembers Budget',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          //body:tabs[_currentIndex],
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
                      child: MyBarGraph(
                        monthlyExpenses: monthlyExpenses,
                        monthlyBudget: monthlyBudget,
                      ),
                    ),

                    const SizedBox(height: 50),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //color: Colors.white,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: textBoxPos("10,000"),
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
                                  "Remaining Monthly Budget: ",
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: textBoxPos("5,000"),
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
                                child: textBoxNeg("-100"),
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
                                child: textBoxNeg("-22"),
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
                                child: textBoxNeg("-20"),
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
                  ]),
            ),
          ),
        ),
      );
}
