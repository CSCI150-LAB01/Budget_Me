import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:async';

Stream<Map<String, double>> getUserExpensesStream(String userId) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data.map((key, value) =>
          MapEntry(key, double.tryParse(value.toString()) ?? 0.0));
    } else {
      return {};
    }
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

  return data.entries.where((entry) => entry.key != "income").map((entry) {
    final color = shuffledColors[colorIndex % shuffledColors.length];
    colorIndex++;

    final isTouched = data.entries.toList().indexOf(entry) == touchedIndex;
    final fontSize = isTouched ? 18.0 : 10.0;
    final radius = isTouched ? 60.0 : 50.0;

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

  Map<String, Color> getCategoryColorMapping() {
    return categoryColorMap;
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

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Shuffle colors only once when the data is received
          if (categoryColorMap.isEmpty) {
            shuffledColors.shuffle(Random());
            int colorIndex = 0;
            snapshot.data!.forEach((category, value) {
              if (category != "income") {
                categoryColorMap[category] =
                    shuffledColors[colorIndex % shuffledColors.length];
                colorIndex++;
              }
            });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                widget.onColorsShuffled(categoryColorMap);
              }
            });
          }
        }

        //Get Income Parameters
        double income = snapshot.data!['income'] ?? 0.0;
        double totalExpenses = snapshot.data!.values
            .fold(0.0, (sum, item) => item != income ? sum + item : sum);
        double remainingBudget = income - totalExpenses;

        // Use fetched data to create pie chart sections
        List<PieChartSectionData> sections =
            getPieChartSections(snapshot.data!, touchedIndex, shuffledColors);

        return Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              swapAnimationDuration: const Duration(milliseconds: 750),
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
