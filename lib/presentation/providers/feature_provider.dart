import 'package:flutter/material.dart';
import 'package:sismo/config/api/errors/custom_error.dart';
import 'package:sismo/config/api/sismo_api.dart';
import 'package:sismo/infraestructure/models/comment/comment_mode.dart';
import 'package:sismo/infraestructure/models/comment/comment_response.dart';
import 'package:sismo/infraestructure/models/feature/feature_model.dart';
import 'package:sismo/presentation/services/services.dart';

class FeatureProvider extends ChangeNotifier {
  bool _isLoading = false;
  FeatureModel? feature;
  List<CommentModel>? comments;
  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<FeatureModel?> getfeaturesById({
    required String id,
  }) async {
    isLoading = true;
    try {
      final response = await SismoApi.httpGet('/$id/feature');
      final Map<String, dynamic> json = response.data;
      final resp = FeatureModel.fromJson(json['data']);
      feature = resp;
      isLoading = false;
      return feature;
    } catch (e) {
      isLoading = false;
      NotificationsService.showSnackbarError('Error al traer el feature');
      throw Exception(e);
    }
  }

  Future<List<CommentModel>?> getComments({
    required String id,
  }) async {
    isLoading = true;
    try {
      final response = await SismoApi.httpGet('/$id/comments');
      final Map<String, dynamic> json = response.data;
      final resp = CommentResponse.fromJson(json);
      comments = resp.data;
      isLoading = false;
      return comments;
    } catch (e) {
      isLoading = false;
      NotificationsService.showSnackbarError('Error al traer los comentarios');
      throw Exception(e);
    }
  }

  Future updatefeatures() async {
    isLoading = true;
    final data = {
      "event_id": feature!.idEvent,
      "magnitude": feature!.magnitude,
      "place": feature!.place,
      "time": feature!.time,
      "tsunami": feature!.tsunami,
      "mag_type": feature!.magType,
      "external_url": feature!.links,
      "title": feature!.title,
      "longitude": feature!.longitude,
      "latitude": feature!.latitude,
    };
    try {
      final response = await SismoApi.httpPut('/${feature!.id}/feature', data);
      final Map<String, dynamic> json = response.data;
      final resp = FeatureModel.fromJson(json['data']);
      feature = resp;
      isLoading = false;
      NotificationsService.showSnackbarSuccess('Feature actualizado');
    } on CustomError catch (e) {
      NotificationsService.showSnackbarError(e.message);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      NotificationsService.showSnackbarError('Error al actualizar el feature');
      throw Exception(e);
    }
  }

  Future createComment({
    required String comment,
  }) async {
    isLoading = true;
    final data = {
      "body": comment,
    };
    try {
      await SismoApi.httpPost('/${feature!.id}/comment', data);
      getComments(id: feature!.id.toString());
      isLoading = false;
      NotificationsService.showSnackbarSuccess('Comentario creado');
    } catch (e) {
      isLoading = false;
      NotificationsService.showSnackbarError('Error al crear comentario');
      throw Exception(e);
    }
  }

  copyWith({
    int? magnitude,
    String? place,
    String? time,
    bool? tsunami,
    String? magType,
    String? title,
    int? longitude,
    int? latitude,
    String? links,
  }) {
    feature = FeatureModel(
      id: feature!.id,
      idEvent: feature!.idEvent,
      magnitude: magnitude ?? feature!.magnitude,
      place: place ?? feature!.place,
      time: time ?? feature!.time,
      tsunami: tsunami ?? feature!.tsunami,
      magType: magType ?? feature!.magType,
      title: title ?? feature!.title,
      longitude: longitude ?? feature!.longitude,
      latitude: latitude ?? feature!.latitude,
      links: links ?? feature!.links,
    );
  }
}
