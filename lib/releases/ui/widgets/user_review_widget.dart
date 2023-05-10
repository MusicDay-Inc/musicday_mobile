import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';

class UserReviewWidget extends StatelessWidget {
  final Review? review;
  final VoidCallback? onWriteClick;
  final VoidCallback? onDeleteClick;

  const UserReviewWidget({
    super.key,
    this.review,
    this.onWriteClick,
    this.onDeleteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(AppLocalizations.of(context)!.yourReview, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 6),
                if (review != null) RatingStarsWidget(filled: review!.rating, total: 5, size: 14),
              ]),
              const SizedBox(height: 4),
              Text(
                review?.text ?? AppLocalizations.of(context)!.writeReviewHint,
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: TextButton(
            onPressed: review != null ? onDeleteClick : onWriteClick,
            child: Text(
              review != null ? AppLocalizations.of(context)!.deleteReview : AppLocalizations.of(context)!.writeReview,
            ),
          ),
        )
      ],
    );
  }
}
