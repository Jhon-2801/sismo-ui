import 'package:flutter/material.dart';
import 'package:sismo/config/api/sismo_api.dart';

class TicketProvider extends ChangeNotifier {
  bool _isLoading = false;
  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registrarTicket({
    required int perPer,
    required int page,
  }) async {
    isLoading = true;
    try {
      final _ = await SismoApi.httpGet('/features');
    } catch (e) {
      isLoading = false;
      throw Exception(e);
    }
    return null;
  }
}
