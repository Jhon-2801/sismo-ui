import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sismo/infraestructure/datasources/features_datasource.dart';
import 'package:sismo/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  static const name = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final source = CustomerDatasource(context: context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Features',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Registro de sismos de los ultimos 30 dias',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          _DataTable(source: source)
        ],
      ),
    );
  }
}

class _DataTable extends StatefulWidget {
  final CustomerDatasource source;
  const _DataTable({
    required this.source,
  });

  @override
  State<_DataTable> createState() => _HomeViewState();
}

class _HomeViewState extends State<_DataTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomPaginatedDataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Place')),
          DataColumn(label: Text('Mag Type')),
          DataColumn(label: Text('Mas informacion')),
        ],
        title: 'Sismos',
        source: widget.source,
        filterServerSide: widget.source.filterServerSide,
      ),
    );
  }
}
