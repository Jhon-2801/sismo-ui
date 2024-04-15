class CommentModel {
  final int id;
  final int featureId;
  final String body;
  final DateTime createdAt;

  CommentModel({
    required this.id,
    required this.featureId,
    required this.body,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        featureId: json["feature_id"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
