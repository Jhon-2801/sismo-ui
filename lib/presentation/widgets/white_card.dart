import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? height;

  const WhiteCard(
      {super.key, required this.child, this.width, this.height, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(top: 10, bottom: 40),
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Container(
              width: double.infinity,
              height: 40,
              color: const Color(0xff25283a),
              child: Center(
                  child: Text(
                title!,
                style: const TextStyle(color: Colors.white),
              )),
            ),
          const SizedBox(
            height: 10,
          ),
          child
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)
          ]);
}
