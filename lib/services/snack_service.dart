import 'package:flutter/material.dart';

class SnackService {
  static void showSnackBar({
    required String message,
    required BuildContext context,
    VoidCallback? onUndo,
    bool isDelete = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        action:
            isDelete ? SnackBarAction(label: 'Undo', onPressed: onUndo!) : null,
      ),
    );
  }
}
