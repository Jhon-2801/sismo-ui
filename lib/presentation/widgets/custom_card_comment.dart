import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomCardComment extends StatelessWidget {
  final String comment;
  final DateTime time;
  const CustomCardComment({Key? key, required this.comment, required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    String formattedDate = DateFormat.yMMMMd('es').format(time);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.comment),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                const SizedBox(height: 5),
                Text(
                  formattedDate,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
