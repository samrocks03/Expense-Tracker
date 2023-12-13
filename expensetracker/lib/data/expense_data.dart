// ignore_for_file: non_constant_identifier_names, slash_for_doc_comments

import 'package:expensetracker/datetime/date_time_helper.dart';
import 'package:expensetracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier{

  // List of all expenses
  List<ExpenseItem> overAllExpenseList = [];

  // Get Expense List
  List<ExpenseItem> getAllExpenses(){
    return overAllExpenseList;
  }

  // Add new expense
  void addNewExpense(ExpenseItem newExpense){
    overAllExpenseList.add(newExpense);
    notifyListeners();
  }

  // Delete expense
  void deleteExpense(ExpenseItem expense){
    overAllExpenseList.remove(expense);
    notifyListeners();
  }

  // Get WeekDay from a dateTIme object
  String getDayName(DateTime dateTime){

    switch(dateTime.weekday){
      case 1:
          return "Monday";

      case 2:
          return "Tuesday";

      case 3:
          return "Wednesday";

      case 4:
          return "Thursday";

      case 5:
          return "Friday";

      case 6:
          return "Friday";

      case 7:
          return "Sunday";

      default:
          return "";
    }
  }

  // get the date for start of the week [ sunday ]
  DateTime getStartOfTheWeek(){
    DateTime? start_of_week;

    // get Today's date:
    DateTime today = DateTime.now();

    // backtracking to the nearest sunday
    for(int i=0;i<7;i++){
      if(getDayName(today.subtract(
                  Duration(days:i))
                  )
          == 'Sunday'){

            start_of_week = today.subtract(Duration(days:i));
      }
    }
    return start_of_week!;
  }


  /**
   * Convert a list of overall expenses into a daily expense summary
   * Ex. overallExpenseList = [
   * [food,2023/12/1,$10]
   * [drinks,2023/12/1,$10]
   * [water,2023/12/1,$10]
   * [health,2023/12/1,$10]
   * ]
   * 
   * -> DailyExpenseSummary = [
   *    Summary for each day with how much was spent at the end
   * ]
   */


  Map<String,double> calculateDailyExpenseSummary(){
      Map<String,double> dailyExpenseSummary = {
          // Date yyyy.mm.dd : amount_total_for_the_day 
      };

      for (var expense in overAllExpenseList){
        String date = convertTheDateTimeToString(expense.dateTime);
        double amount = double.parse(expense.amount);


        if(dailyExpenseSummary.containsKey(date)){
          double currentAmount = dailyExpenseSummary[date]!;
          currentAmount += amount;
          dailyExpenseSummary[date]=currentAmount;
        }else{
          dailyExpenseSummary.addAll({date:amount});
        }
      }
      return dailyExpenseSummary;
  }
}