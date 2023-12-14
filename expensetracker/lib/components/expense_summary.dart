// ignore_for_file: prefer_const_constructors

import 'package:expensetracker/bar_graph/bar_graph.dart';
import 'package:expensetracker/data/expense_data.dart';
import 'package:expensetracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummaryWidget extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummaryWidget({super.key, required this.startOfWeek});

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
      builder: (context, value, child) => SizedBox(
          height: 200,
          child: MyBarGraph(
              maxY: 100,
              sundayAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
              mondayAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
              tuesdayAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
              wednesdayAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
              thursdayAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
              fridayAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
              saturdayAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0
              ),
        )
    );
  }
}
