// ignore_for_file: prefer_const_constructors

import 'package:expensetracker/data/expense_data.dart';
import 'package:expensetracker/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context,child) => MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
          // fontFamily:  GoogleFonts.gochiHand().toString()
        )
      ),
    );
  }
}