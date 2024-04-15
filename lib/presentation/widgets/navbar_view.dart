import 'package:flutter/material.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key, required this.name, required this.onPressed});
  final String name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          TextButton(
              onPressed: () => onPressed(),
              child: const Text('Atrás /',
                  style: TextStyle(color: Colors.blueAccent))),
          Text(
            name,
          ),
        ],
      ),
    );
  }
}
