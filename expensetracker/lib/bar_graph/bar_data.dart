// ignore_for_file: non_constant_identifier_names

import 'package:expensetracker/bar_graph/individual_bar.dart';

class BarData{

  final double MondayData;
  final double TuesdayData;
  final double WednesdayData;
  final double ThursdayData;
  final double FridayData;
  final double SaturdayData;
  final double SundayData;


  BarData({
    required this.MondayData, 
    required this.TuesdayData, 
    required this.WednesdayData, 
    required this.ThursdayData, 
    required this.FridayData, 
    required this.SaturdayData, 
    required this.SundayData
  });

  List<IndividualBar> barData = [];
  // initialize the bar data
  void initializeBarData(){
    // individual bar data

    barData = [
      IndividualBar(x: 0, y: SundayData),  //Sunday
      IndividualBar(x: 1, y: MondayData),  //Monday
      IndividualBar(x: 2, y: TuesdayData),  //Tuesday
      IndividualBar(x: 3, y: WednesdayData),  //Wednesday
      IndividualBar(x: 4, y: ThursdayData),  //Thursday
      IndividualBar(x: 5, y: FridayData),  //Friday
      IndividualBar(x: 6, y: SaturdayData),  //Saturday
    ];
  }

}