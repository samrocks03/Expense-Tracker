import 'package:flutter/material.dart';


class ListTileWidget extends StatelessWidget {
  final DateTime dateTime;
  final String name,amount;

  const ListTileWidget({
    super.key, 
    required this.dateTime,
    required this.name,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
    title: Text(name),
    subtitle: Text("${dateTime.day} / ${dateTime.month} / ${dateTime.year}"),
    trailing: Text("₹ $amount"));
  }
}