import 'package:flutter/cupertino.dart';

class DialogHelpers {
  static Future<void> showLoading(BuildContext context, String title) async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text(title),
            content: CupertinoActivityIndicator(),
          ),
    );
  }

  static Future<void> closeDialog(BuildContext context) async {
    if (Navigator.of(context, rootNavigator: false).canPop()) {
      Navigator.of(context, rootNavigator: false).pop();
    }
  }

  static Future<void> showSuccess(
    BuildContext context,
    String message, {
    void Function()? onPressed,
  }) async {
    await showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Success"),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  if (onPressed != null) onPressed();
                },
              ),
            ],
          ),
    );
  }

  static Future<void> showError(BuildContext context, String error) async {
    await showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(error),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () async {
                  closeDialog(context);
                },
              ),
            ],
          ),
    );
  }
}
