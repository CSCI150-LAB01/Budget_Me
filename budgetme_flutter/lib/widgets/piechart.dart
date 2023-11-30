import 'package:budgetme_flutter/widgets/global.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';

import 'package:rxdart/rxdart.dart';

Stream<Map<String, double>> getUserExpensesStream(String userId) {
  // Stream from the 'users' collection (for static expenses)
  Stream<Map<String, double>> staticExpensesStream = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
    Map<String, double> staticExpenses = {};
    if (snapshot.exists) {
      snapshot.data()!.forEach((key, value) {
        if (key != "email" && key != "name") {
          staticExpenses[key] = double.tryParse(value.toString()) ?? 0.0;
        }
      });
    }
    return staticExpenses;
  });

  // Stream from the 'expenses' collection (for dynamic expenses)
  Stream<Map<String, double>> dynamicExpensesStream = FirebaseFirestore.instance
      .collection('expenses')
      .where('userId', isEqualTo: userId)
      .snapshots()
      .map((snapshot) {
    Map<String, double> dynamicExpenses = {};
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String category = data['category'];
      double amount = data['amount'].toDouble();
      dynamicExpenses.update(category, (existing) => existing + amount,
          ifAbsent: () => amount);
    }
    return dynamicExpenses;
  });

  // Combining both streams
  return Rx.combineLatest2(staticExpensesStream, dynamicExpensesStream,
      (Map<String, double> staticExpenses,
          Map<String, double> dynamicExpenses) {
    Map<String, double> combinedExpenses = {};
    staticExpenses.forEach((key, value) {
      combinedExpenses.update(key, (existing) => existing + value,
          ifAbsent: () => value);
    });
    dynamicExpenses.forEach((key, value) {
      combinedExpenses.update(key, (existing) => existing + value,
          ifAbsent: () => value);
    });
    return combinedExpenses;
  });
}

List<Color> getShuffledColors() {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.lime,
    Colors.brown,
    Colors.teal,
  ];
  colors.shuffle(Random()); // Shuffle the colors
  return colors;
}

List<PieChartSectionData> getPieChartSections(
    Map<String, double> data, int? touchedIndex, List<Color> shuffledColors) {
  int colorIndex = 0;

  return data.entries
      .where((entry) =>
          entry.key != "income" && entry.key != "email" && entry.key != "name")
      .map((entry) {
    final color = shuffledColors[colorIndex % shuffledColors.length];
    colorIndex++;

    final isTouched = data.entries.toList().indexOf(entry) == touchedIndex;
    final fontSize = isTouched ? 18.0 : 10.0;
    final radius = isTouched ? 60.0 : 50.0;
    color_Map[entry.key] = color;
    return PieChartSectionData(
      color: color, // You need to define this function
      value: entry.value,
      radius: radius,
      titlePositionPercentageOffset: .5,
      title: isTouched ? '\$${entry.value.toStringAsFixed(2)}' : '',
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }).toList();
}

class MyPieChart extends StatefulWidget {
  final String userId;
  final Function(Map<String, Color>) onColorsShuffled;

  const MyPieChart({
    Key? key,
    required this.userId,
    required this.onColorsShuffled,
  }) : super(key: key); // Modify constructor to accept userId
  @override
  // ignore: library_private_types_in_public_api
  _MyPieChartState createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  int? touchedIndex;
  Map<String, Color> categoryColorMap = {};
  List<Color> shuffledColors = getShuffledColors();
  Timer? _debounce;

  void _updateTouchedIndex(int? newIndex) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        touchedIndex = newIndex;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    shuffledColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.amber,
      Colors.cyan,
      Colors.lime,
      Colors.brown,
      Colors.teal,
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onColorsShuffled(categoryColorMap);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, double>>(
      stream: getUserExpensesStream(
          widget.userId), // Use the userId to fetch expenses
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while waiting
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Handle errors
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No data available"); // Handle no data case
        }

        //Get Income Parameters
        double income = snapshot.data!['income'] ?? 0.0;
        double totalExpenses = 0.0;
        snapshot.data!.forEach((category, value) {
          if (category != 'income' &&
              category != 'email' &&
              category != 'name') {
            totalExpenses += value;
          }
        });
        double remainingBudget = income - totalExpenses;

        // Use fetched data to create pie chart sections
        List<PieChartSectionData> sections = getPieChartSections(
          snapshot.data!,
          touchedIndex,
          shuffledColors,
        );

        return Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              swapAnimationDuration: const Duration(milliseconds: 500),
              swapAnimationCurve: Curves.easeInOutQuint,
              PieChartData(
                sections: sections,
                pieTouchData: PieTouchData(
                  touchCallback:
                      (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                    if (event is FlLongPressEnd || event is FlPanEndEvent) {
                      _updateTouchedIndex(-1);
                    } else if (pieTouchResponse != null &&
                        pieTouchResponse.touchedSection != null) {
                      _updateTouchedIndex(
                          pieTouchResponse.touchedSection!.touchedSectionIndex);
                    }
                  },
                ),
              ), // Use dynamic sections here
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Remaining: \$${remainingBudget.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
