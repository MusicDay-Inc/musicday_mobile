import 'package:flutter/material.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_theme.dart';

class RatingStarsWidget extends StatelessWidget {
  final double size;
  final void Function(int)? onSelect;
  final bool expanded;
  final int filled;
  final int total;

  const RatingStarsWidget({
    super.key,
    this.onSelect,
    this.expanded = false,
    required this.filled,
    required this.total,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: expanded ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        for (var i = 0; i < total; ++i) ...[
          GestureDetector(
            onTap: onSelect != null ? () => onSelect!(i + 1) : null,
            child: Icon(
              i < filled ? Icons.star : Icons.star_outline,
              color: RatingStarsTheme.of(context).starsColor,
              size: size,
            ),
          ),
        ]
      ],
    );
  }
}
