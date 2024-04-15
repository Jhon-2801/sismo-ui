import 'package:sismo/infraestructure/models/comment/comment_mode.dart';

class CommentResponse {
  final List<CommentModel> data;
  final int status;

  CommentResponse({
    required this.data,
    required this.status,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponse(
        data: List<CommentModel>.from(
            json["data"].map((x) => CommentModel.fromJson(x))),
        status: json["status"],
      );
}
