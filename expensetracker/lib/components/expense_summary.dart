// ignore_for_file: prefer_const_constructors

import 'package:expensetracker/bar_graph/bar_graph.dart';
import 'package:expensetracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummaryWidget extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummaryWidget({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
          height: 200,
          child: MyBarGraph(
              maxY: 100,
              sundayAmount: 12,
              mondayAmount: 15,
              tuesdayAmount: 11,
              wednesdayAmount: 19,
              thursdayAmount: 25,
              fridayAmount: 23,
              saturdayAmount: 12),
        )
    );
  }
}
