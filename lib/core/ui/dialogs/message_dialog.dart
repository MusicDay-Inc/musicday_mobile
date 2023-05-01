import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageDialog {
  MessageDialog._();

  /// Показывает диалог с определенным сообщением.
  static Future<void> show(BuildContext context, {required String title, required String content}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.ok),
            )
          ],
        );
      },
    );
  }
}
