import 'package:flutter/material.dart';

class CustomDataTime extends StatefulWidget {
  final Function(DateTime) onSelectedDate;
  final TextEditingController controller;
  const CustomDataTime(
      {super.key, required this.onSelectedDate, required this.controller});

  @override
  State<CustomDataTime> createState() => _CustomDataTimeState();
}

class _CustomDataTimeState extends State<CustomDataTime> {
  DateTime selectedDate = DateTime.now();
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onSelectedDate(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration(
          labelText: "Time",
        ),
        onTap: () async {
          selectDate(context);
        },
      ),
    );
  }
}
