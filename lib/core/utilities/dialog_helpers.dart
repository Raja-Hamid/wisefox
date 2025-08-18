import 'package:flutter/cupertino.dart';

class DialogHelpers {
  static void showLoading(BuildContext context, String title) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => CupertinoAlertDialog(
            title: Text(title),
            content: CupertinoActivityIndicator(),
          ),
    );
  }

  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void showSuccess(
    BuildContext context,
    String message, {
    void Function()? onPressed,
  }) {
    DialogHelpers.closeDialog(context);
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Success"),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  if (onPressed != null) onPressed();
                },
              ),
            ],
          ),
    );
  }

  static void showError(BuildContext context, String error) {
    DialogHelpers.closeDialog(context);
    showCupertinoDialog(
      context: context,
      builder:
          (_) => CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(error),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          ),
    );
  }
}
