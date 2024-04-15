import 'package:flutter/material.dart';

import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';

class CustomPaginatedDataTable extends StatefulWidget {
  final double? dataRowHeight;
  final String title;
  final int rowsPerPage;
  final Function(String) filterServerSide;
  final ValueChanged<int?>? onRowsPerPageChanged;
  final AdvancedDataTableSource source;
  final bool sortAscending;
  final int sortColumnIndex;
  final List<DataColumn> columns;
  final List<Widget>? actions;

  const CustomPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.sortColumnIndex = 1,
    this.actions,
    this.dataRowHeight = 50.0,
    required this.columns,
    required this.title,
    required this.source,
    required this.filterServerSide,
    this.rowsPerPage = 10,
    this.onRowsPerPageChanged,
  });

  @override
  State<CustomPaginatedDataTable> createState() =>
      _CustomPaginatedDataTableState();
}

class _CustomPaginatedDataTableState extends State<CustomPaginatedDataTable> {
  final _searchController = TextEditingController();
  int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _searchController.text = '';
    rowsPerPage = widget.rowsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedPaginatedDataTable(
      dataRowHeight: widget.dataRowHeight!,
      addEmptyRows: true,
      actions: widget.actions,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(widget.title),
        ],
      ),
      onRowsPerPageChanged: (value) {
        setState(() {
          rowsPerPage = value ?? 20;
        });
      },
      rowsPerPage: rowsPerPage,
      columns: widget.columns,
      source: widget.source,
      availableRowsPerPage: const [1, 10, 20, 50, 100],
      showHorizontalScrollbarAlways: true,
      sortAscending: widget.sortAscending,
      sortColumnIndex: widget.sortColumnIndex,
    );
  }
}
