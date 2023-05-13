import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_theme.dart';

class ReleaseItemWidget extends StatelessWidget {
  final Activity activity;

  const ReleaseItemWidget({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: activity.release.avatarUrl == null ? Theme.of(context).colorScheme.primaryContainer : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: activity.release.avatarUrl != null ? Image.network(activity.release.avatarUrl!) : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(activity.release.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(activity.review.rating.toStringAsFixed(1)),
                    Icon(Icons.star, size: 15, color: RatingStarsTheme.of(context).starsColor),
                  ]),
                ],
              ),
              Text(activity.release.author),
              Text.rich(TextSpan(children: [
                if (activity.release is Album) ...[
                  TextSpan(text: "album", style: TextStyle(color: Theme.of(context).hintColor)),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.circle,
                      color: Theme.of(context).hintColor,
                      size: 6,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  TextSpan(
                      text: "${(activity.release as Album).songsCount} songs",
                      style: TextStyle(color: Theme.of(context).hintColor)),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.circle,
                      color: Theme.of(context).hintColor,
                      size: 6,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 5)),
                ] else if (activity.release is Song) ...[
                  TextSpan(text: "song", style: TextStyle(color: Theme.of(context).hintColor)),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.circle,
                      color: Theme.of(context).hintColor,
                      size: 6,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  TextSpan(
                      text: (activity.release as Song).durationInSeconds.formatSecondsToDuration(),
                      style: TextStyle(color: Theme.of(context).hintColor)),
                  const WidgetSpan(child: SizedBox(width: 5)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.circle,
                      color: Theme.of(context).hintColor,
                      size: 6,
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 5)),
                ],
                TextSpan(text: "${activity.release.year}", style: TextStyle(color: Theme.of(context).hintColor)),
              ])),
            ],
          ),
        ),
      ]),
    );
  }
}
