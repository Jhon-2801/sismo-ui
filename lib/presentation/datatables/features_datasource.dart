import 'package:flutter/material.dart';
import 'package:sismo/presentation/services/services.dart';

class FeaturesDTS extends DataTableSource {
  final BuildContext context;
  FeaturesDTS(this.context);
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      const DataCell(Text('Campo 1')),
      const DataCell(Text('Campo 2')),
      const DataCell(Text('Campo 3')),
      const DataCell(Text('Campo 4')),
      const DataCell(Text('Campo 5')),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              NotificationsService.showSnackbarInfo('Que va bobo hp');
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
