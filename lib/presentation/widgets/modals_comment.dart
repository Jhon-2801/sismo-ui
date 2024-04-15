import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sismo/presentation/providers/feature_provider.dart';
import 'package:sismo/presentation/widgets/widgets.dart';

class ModalComment extends StatefulWidget {
  const ModalComment({super.key});

  @override
  State<ModalComment> createState() => _ModalCommentState();
}

class _ModalCommentState extends State<ModalComment> {
  late String comment = '';
  @override
  Widget build(BuildContext context) {
    final featureProvider = Provider.of<FeatureProvider>(context);
    return Container(
      padding: const EdgeInsets.all(70),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Comentario',
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Comentario',
            onChanged: (value) {
              comment = value;
            },
          ),
          const SizedBox(height: 40),
          CustomButton(
              name: 'Crear',
              onPressed: () {
                featureProvider.createComment(comment: comment);
              })
        ],
      ),
    );
  }
}
