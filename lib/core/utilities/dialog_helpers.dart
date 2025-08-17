import 'package:flutter/cupertino.dart';

class DialogHelpers {
  static void showLoading(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) return;
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) =>
              const CupertinoAlertDialog(content: CupertinoActivityIndicator()),
    );
  }

  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void showSuccess(BuildContext context, String message) {
    closeDialog(context);
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Success"),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () => closeDialog(context),
              ),
            ],
          ),
    );
  }

  static void showError(BuildContext context, String error) {
    closeDialog(context);
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(error),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () => closeDialog(context),
              ),
            ],
          ),
    );
  }
}
