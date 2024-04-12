import 'package:flutter/material.dart';
import 'package:sismo/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final Widget child;
  const HomePage({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              Expanded(child: child),
            ],
          )
        ],
      ),
    );
  }
}
