import 'package:sismo/infraestructure/models/feature_model.dart';

class FeatureResponse {
  final List<FeatureModel> data;
  final Pagination pagination;

  FeatureResponse({
    required this.data,
    required this.pagination,
  });

  factory FeatureResponse.fromJson(Map<String, dynamic> json) =>
      FeatureResponse(
        data: List<FeatureModel>.from(
            json["data"].map((x) => FeatureModel.fromJson(x))),
        pagination: Pagination.fromMap(json["pagination"]),
      );
}

class Pagination {
  final int currenPage;
  final int perPage;
  final int total;

  Pagination({
    required this.currenPage,
    required this.perPage,
    required this.total,
  });

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        currenPage: json["curren_page"],
        perPage: json["perPage"],
        total: json["total"],
      );
}
