import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sismo/presentation/datatables/features_datasource.dart';

class HomeView extends StatelessWidget {
  static const name = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Features',
                style: GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(
                '9980 Found',
                style: GoogleFonts.aBeeZee(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Place')),
              DataColumn(label: Text('Event Time')),
              DataColumn(label: Text('URL')),
              DataColumn(label: Text('Ver mas')),
            ],
            source: FeaturesDTS(context),
          )
        ],
      ),
    );
  }
}
