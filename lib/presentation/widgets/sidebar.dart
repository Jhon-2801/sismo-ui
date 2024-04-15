import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sismo/presentation/widgets/logo.dart';
import 'package:sismo/presentation/widgets/menu_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      color: const Color(0xff25283a),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 60),
          MenuItem(
              text: 'Features',
              icon: Icons.assessment_rounded,
              onPressed: () {
                context.go("/home");
              })
        ],
      ),
    );
  }
}
