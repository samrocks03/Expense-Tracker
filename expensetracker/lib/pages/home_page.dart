// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:expensetracker/components/expense_summary.dart';
import 'package:expensetracker/data/expense_data.dart';
import 'package:expensetracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/expense_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // input-decoration for Dialog box
  InputDecoration input_decoration(String name){
    return InputDecoration(
              labelText: name,
              hintStyle:  GoogleFonts.gochiHand());

  } 
  
  // Textcontrollers : to access the text, user has entered into the TextField
  final new_ExpenseController = TextEditingController();
  final new_Expense_AmountRupeeController = TextEditingController();
  final new_Expense_AmountPaisaController = TextEditingController();

  void save(){
    // Creating the expense item
    String total_amount = "${new_Expense_AmountRupeeController.text}.${new_Expense_AmountPaisaController.text}";
    
    ExpenseItem newExpenseItem = ExpenseItem(
          name: new_ExpenseController.text,
          amount: total_amount,
          dateTime: DateTime.now());

    Provider.of<ExpenseData>(context,listen: false).addNewExpense(newExpenseItem);

    Navigator.pop(context);
    clear();  // to clear the cache present after entering a value in it.
  }

  void cancel(){
    Navigator.pop(context);
    clear();
  }

  void clear(){
    new_ExpenseController.clear();
    new_Expense_AmountRupeeController.clear();
    new_Expense_AmountPaisaController.clear();
  }
  void addNewExpense(){
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Add new expense",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, //to get the minimum size
          children: [

            // Expense name
            TextField( 
              keyboardType: TextInputType.multiline,
              controller: new_ExpenseController,
              decoration: input_decoration("Name")),


            // Expense amount
            Row(
              children: [
                // Rupee
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number, 
                    controller: new_Expense_AmountRupeeController,
                    decoration: input_decoration("Amt in ₹")),
                ),
            
                // Paisaa
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number, 
                    controller: new_Expense_AmountPaisaController,
                    decoration: input_decoration("Amt in प.")),
                ),
            
              ]
            )
          ],
        ),

        actions: [
          // Save Button
            MaterialButton(onPressed: save,
              child: Text("Save",
                      style:  GoogleFonts.aDLaMDisplay(
                        color: Colors.green
                    ))
              ),

            // Cancel Button
            MaterialButton(onPressed: cancel,
            child: Text("Cancel",
                    style:  GoogleFonts.aDLaMDisplay(
                      color: Colors.red
                  ))
            )
        ],
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
    
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: Icon(Icons.add)),
    
    
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
            child: SafeArea(
              child: ListView(
                children: [
                  // weekly - summary
                  ExpenseSummaryWidget(startOfWeek: value.getStartOfTheWeek()),
              
                  SizedBox(height: 20),

                  // expense - list
                 ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),  //since it should not be scrollable
                  itemCount : value.getAllExpenses().length,
                  itemBuilder: (context,index) => ListTileWidget(
                      dateTime: value.getAllExpenses()[index].dateTime ,
                      name: value.getAllExpenses()[index].name,
                      amount: value.getAllExpenses()[index].amount
                      )
                
                ),
              
                ],
              ),
            ),
          )
      ),
    );
  }
}