// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:expensetracker/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sundayAmount;
  final double mondayAmount;
  final double tuesdayAmount;
  final double wednesdayAmount;
  final double thursdayAmount;
  final double fridayAmount;
  final double saturdayAmount;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.sundayAmount,
    required this.mondayAmount,
    required this.tuesdayAmount,
    required this.wednesdayAmount,
    required this.thursdayAmount,
    required this.fridayAmount,
    required this.saturdayAmount,
  });

  @override
  Widget build(BuildContext context) {
    // initializing the bar data
    BarData myBarData = BarData(
        MondayData:  mondayAmount,
        TuesdayData:  tuesdayAmount,
        WednesdayData:  wednesdayAmount,
        ThursdayData:  thursdayAmount,
        FridayData:  fridayAmount,
        SaturdayData:  saturdayAmount,
        SundayData:  sundayAmount);

    myBarData.initializeBarData();


    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        barGroups: myBarData.barData
                    .map((data) => 
                      BarChartGroupData(x: data.x,
                                        barRods: [
                                          BarChartRodData(toY: data.y)
                                        ]))
                    .toList(),
        
      ));
  }
}
