import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/formatting/date_formatting_extensions.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';

class AnotherUserReviewWidget extends StatelessWidget {
  final int rating;
  final int reviewTimestamp;
  final String? authorAvatar;
  final String authorName;
  final String authorId;
  final String comment;

  const AnotherUserReviewWidget({
    super.key,
    required this.rating,
    required this.comment,
    required this.authorId,
    required this.authorName,
    required this.reviewTimestamp,
    this.authorAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const AvatarWidget(size: 16),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName, style: const TextStyle(fontSize: 14)),
                    Row(
                      children: [
                        RatingStarsWidget(filled: rating, total: 5, size: 14),
                        const SizedBox(width: 4),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          reviewTimestamp.formatDate(),
                          style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 8),
              Text(comment, style: TextStyle(color: Theme.of(context).hintColor)),
            ],
          ),
        ),
      ],
    );
  }
}
