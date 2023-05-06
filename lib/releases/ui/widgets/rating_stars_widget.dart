import 'package:flutter/material.dart';

class RatingStarsWidget extends StatelessWidget {
  final double size;
  final int filled;
  final int total;

  const RatingStarsWidget({
    super.key,
    required this.filled,
    required this.total,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var i = 0; i < filled; ++i) ...[
        Icon(Icons.star, size: size, color: Theme.of(context).buttonTheme.colorScheme!.primary),
      ],
      for (var i = 0; i < total - filled; ++i) ...[
        Icon(Icons.star_outline, size: size, color: Theme.of(context).buttonTheme.colorScheme!.primary),
      ]
    ]);
  }
}
