// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:expensetracker/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        gridData: FlGridData( show:false), //not-showing the grid data
        borderData: FlBorderData(show:false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)),

          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false)),
          

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles
            )
          ),

          
        ),
        barGroups: myBarData.barData
        .map((data) => 
          BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: Colors.grey[800],
                width: 20,
                borderRadius: BorderRadius.circular(5),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: Colors.grey[100],
                  toY: maxY
                  ))
              
              ]))
        .toList(),
        
      ));
  }
}

Widget getBottomTitles(double value,TitleMeta meta){
  final style = GoogleFonts.abel(
        color: Colors.purple[600],
    fontWeight: FontWeight.bold,
    fontSize: 12
  );
  // TextStyle(
  //   color: Colors.purple[600],
  //   fontFamily: ,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 10
  // );


  Widget text;
  switch(value.toInt()){
    case 0:
      text = Text("Sun",style:style);
      break;

    case 1:
      text = Text("Mon",style:style);
      break;

    case 2:
      text = Text("Tues",style:style);
      break;

    case 3:
      text = Text("Wed",style:style);
      break;

    case 4:
      text = Text("Thurs",style:style);
      break;

    case 5:
      text = Text("Fri",style:style);
      break;

    case 6:
      text = Text("Sat",style:style);
      break;

    default:
      text = Text(" ",style:style);
      break;
  }//switch-end

  return SideTitleWidget(
     axisSide: meta.axisSide,
    child: text
  );
}