import 'package:flutter/material.dart';

class RatingStarsTheme extends InheritedWidget {
  final Color starsColor;

  const RatingStarsTheme({
    super.key,
    required super.child,
    required this.starsColor,
  });

  static RatingStarsTheme of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<RatingStarsTheme>()!;
  }

  @override
  bool updateShouldNotify(covariant RatingStarsTheme oldWidget) {
    return oldWidget.starsColor != starsColor;
  }
}
