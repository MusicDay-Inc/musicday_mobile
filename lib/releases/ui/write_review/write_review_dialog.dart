import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';

class WriteReviewDialog extends StatefulWidget {
  final String releaseId;

  const WriteReviewDialog({
    super.key,
    required this.releaseId,
  });

  static void open(BuildContext context, String releaseId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => WriteReviewDialog(releaseId: releaseId),
    );
  }

  @override
  State<StatefulWidget> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  final _ratingNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _ratingNotifier,
                    builder: (context, value, _) {
                      return RatingStarsWidget(
                        onSelect: (stars) => _ratingNotifier.value = stars,
                        expanded: true,
                        filled: value,
                        total: 5,
                        size: 32,
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 28),
            TextField(
              minLines: 5,
              maxLines: 5,
              maxLength: 2000,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                helperText: AppLocalizations.of(context)!.optional,
                hintText: AppLocalizations.of(context)!.comment,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text(AppLocalizations.of(context)!.cancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _ratingNotifier,
                    builder: (context, value, _) {
                      return FilledButton(
                        onPressed: value > 0 ? () {} : null,
                        child: Text(AppLocalizations.of(context)!.submit),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ratingNotifier.dispose();
    super.dispose();
  }
}
