import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarSuccess(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(message),
    );

    messagerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbarInfo(String message) {
    final snackbar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 81, 148, 203),
      content: Text(message),
    );
    messagerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbarError(String message) {
    final snackbar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 189, 101, 95),
      content: Text(message),
    );
    messagerKey.currentState!.showSnackBar(snackbar);
  }
}
