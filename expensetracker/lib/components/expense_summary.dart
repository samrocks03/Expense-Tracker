// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:expensetracker/bar_graph/bar_graph.dart';
import 'package:expensetracker/data/expense_data.dart';
import 'package:expensetracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummaryWidget extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummaryWidget({super.key, required this.startOfWeek});


  double maxCalculator(ExpenseData value,String sun,String mon,String tues,String wed,String thrus,String fri,String sat){
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sun] ?? 0,
      value.calculateDailyExpenseSummary()[mon] ?? 0,
      value.calculateDailyExpenseSummary()[tues] ?? 0,
      value.calculateDailyExpenseSummary()[wed] ?? 0,
      value.calculateDailyExpenseSummary()[thrus] ?? 0,
      value.calculateDailyExpenseSummary()[fri] ?? 0,
      value.calculateDailyExpenseSummary()[sat] ?? 0,
    ]; 

    values.sort();

    // get the largest value
    max = (values.last * 2.0).toInt() * 1.0; //1.2 = 1 + 0.2 ==> capping 20% more on the bar
    return max == 0 ? 100 : max;
  }


  // Expense calculator for a week
  String calculateWeekTotal(ExpenseData value,String sun,String mon,String tues,String wed,String thrus,String fri,String sat){

    List<double> values = [
      value.calculateDailyExpenseSummary()[sun] ?? 0,
      value.calculateDailyExpenseSummary()[mon] ?? 0,
      value.calculateDailyExpenseSummary()[tues] ?? 0,
      value.calculateDailyExpenseSummary()[wed] ?? 0,
      value.calculateDailyExpenseSummary()[thrus] ?? 0,
      value.calculateDailyExpenseSummary()[fri] ?? 0,
      value.calculateDailyExpenseSummary()[sat] ?? 0,
    ]; 

    double total = 0;
    for(int i =0 ;i<values.length;i++){
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }




  @override
  Widget build(BuildContext context) {

    // Get yyyy.mm.dd -> for each day of this week
    String sunday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tuesday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wednesday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thursday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String friday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String saturday = convertTheDateTimeToString(startOfWeek.add(Duration(days: 6)));


    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Week Total : ",
                  style: TextStyle(fontWeight: FontWeight.bold)),

                Text(calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday))

              ],
            ),
          ),
          
          SizedBox(
              height: 200,
              child: MyBarGraph(
                  maxY: maxCalculator(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
                  sundayAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
                  mondayAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
                  tuesdayAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
                  wednesdayAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
                  thursdayAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
                  fridayAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
                  saturdayAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0
                  ),
            ),
        ],
      )
    );
  }
}
