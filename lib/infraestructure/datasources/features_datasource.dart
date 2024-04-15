import 'package:flutter/material.dart';
import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:go_router/go_router.dart';
import 'package:sismo/config/api/sismo_api.dart';
import 'package:sismo/infraestructure/models/feature/feature_model.dart';
import 'package:sismo/infraestructure/models/feature/feature_response.dart';

class CustomerDatasource extends AdvancedDataTableSource {
  final BuildContext context;
  int total = 0;
  String lastSearchTerm = '';
  List<FeatureModel> titulares = [];
  List magType = ['ml', 'md'];

  CustomerDatasource({required this.context});

  get label => null;

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails> getNextPage(
      NextPageRequest pageRequest) async {
    final page = (pageRequest.offset / pageRequest.pageSize).round() + 1;

    final queryParameter = <String, dynamic>{
      'page': page,
      'per_page': 10,
      'mag_type[]': magType
    };
    try {
      final response = await SismoApi.httpGet('/features', queryParameter);
      final Map<String, dynamic> json = response.data;
      final resp = FeatureResponse.fromJson(json);
      total = resp.pagination.total;
      titulares = resp.data;
    } catch (e) {
      throw Exception(e);
    }
    return RemoteDataSourceDetails(
      total,
      titulares.skip(pageRequest.offset).take(pageRequest.pageSize).toList(),
    );
  }

  @override
  DataRow? getRow(int index) {
    final titular = titulares[index];
    return DataRow(cells: [
      DataCell(SelectableText('${titular.id}')),
      DataCell(SelectableText(titular.title)),
      DataCell(SelectableText(titular.place)),
      DataCell(SelectableText(titular.magType)),
      DataCell(TextButton.icon(
        onPressed: () {
          context.pushReplacement('/feature/${titular.id}');
        },
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Ver mas'),
      )),
    ]);
  }

  @override
  int get selectedRowCount => 0;
}
