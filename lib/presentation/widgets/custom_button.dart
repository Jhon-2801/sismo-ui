import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function onPressed;
  final double? width;
  final Color? color;

  const CustomButton(
      {super.key,
      required this.name,
      required this.onPressed,
      this.width,
      this.color = const Color(0xff092043)});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
