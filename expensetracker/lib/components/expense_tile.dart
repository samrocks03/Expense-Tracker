// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileWidget extends StatelessWidget {
  final DateTime dateTime;
  final String name,amount;
  void Function(BuildContext)? delTapped;

  ListTileWidget({
    Key? key,
    required this.dateTime,
    required this.name,
    required this.amount,
    required this.delTapped, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            //slidable-button
            onPressed: delTapped,
            icon: Icons.delete_sweep_sharp,
            backgroundColor: Colors.red,)
        ],
      ),
      child: ListTile(
      title: Text(name,
                style:GoogleFonts.gochiHand()),
      subtitle: Text("${dateTime.day} / ${dateTime.month} / ${dateTime.year}"),
      trailing: Text("₹ $amount")),
    );
  }
}
