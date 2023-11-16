import 'package:budgetme_flutter/widgets/reusable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget{
  final List monthlyExpenses;
  final List monthlyBudget;
  const MyBarGraph({
    super.key,
    required this.monthlyExpenses,
    required this.monthlyBudget,
  });

  @override
  Widget build(BuildContext context){
    BarData myBarData = BarData(
      totalBudget: monthlyExpenses[0],
      monthlyIncome: monthlyExpenses[1],
      rent: monthlyExpenses[2],
      carPayment: monthlyExpenses[3],
      pets: monthlyExpenses[4],

      totalBudget2: monthlyBudget[0],
      monthlyIncome2: monthlyBudget[1],
      rent2: monthlyBudget[2],
      carPayment2: monthlyBudget[3],
      pets2: monthlyBudget[4],

    );
    myBarData.initBarData();
    
    return BarChart(
      BarChartData(
        maxY: 10000,
        minY: 0,
        gridData: FlGridData(show: false,),
        borderData: FlBorderData(show: false,),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitle),),
        ),
        barGroups: myBarData.barData
        .map(
          (data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(toY: data.y,
              color: Colors.red,
              width: 20,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY:  data.y2,
                color: Color.fromARGB(255, 0, 67, 1),
              ),
              ),
            ],
      
          )
        )
        .toList(),
      ),
    );
  }

}