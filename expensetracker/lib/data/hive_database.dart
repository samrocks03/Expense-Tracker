// ignore_for_file: unused_import

import 'package:expensetracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDataBase {
  // reference out box
  final _myBox = Hive.box("expense_database");

  // write data
  void saveData(List<ExpenseItem> allExpense) {
    // Note - Hive only stores strings and dateTime
    // not custom objects

    /**For that reason, we need to convert the ExpenseItem object into those types
          which could be stored in the hive data-formats

          Meanwhile, 

          alllExpense = [
            ExpenseItem(name,amount,dateTime ),

            ExpenseItem(name,amount,dateTime ),
            
            ExpenseItem(name,amount,dateTime ),
            
            ExpenseItem(name,amount,dateTime ),
          ] 

          Thus, we have to convert these custome objects to 
          --> [name, amount, dateTime]
     */
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpense) {
      // converting each item into  a list of storable types
      // (string, dateTime)
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];

      allExpensesFormatted.add(expenseFormatted);
      _myBox.put("ALL_EXPENSES", allExpensesFormatted);
    }
  }

  // read data
  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      ExpenseItem expense = ExpenseItem(name: name, amount: amount, dateTime: dateTime);

      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
