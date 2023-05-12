import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/formatting/date_formatting_extensions.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityItemWidget extends StatelessWidget {
  final User user;
  final Activity activity;

  const ActivityItemWidget({
    super.key,
    required this.user,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    final release = activity.release;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const AvatarWidget(size: 17),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(user.nickname, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(" rated ${activity.release is Album ? 'album' : 'song'}", style: const TextStyle(fontSize: 14)),
              ]),
              Row(
                children: [
                  RatingStarsWidget(filled: activity.review.rating, total: 5, size: 14),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (activity.review.publishTime.millisecondsSinceEpoch ~/ 1000).formatDate(),
                    style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ],
          ),
        ]),
        const SizedBox(height: 4),
        const Divider(),
        Row(children: [
          Container(
            width: 32,
            height: 34,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: activity.release.name,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                            ),
                          ),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          TextSpan(
                              text: "${activity.release.year}",
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                            ),
                          ),
                          const WidgetSpan(child: SizedBox(width: 4)),
                          if (release is Album) ...[
                            TextSpan(
                                text: "${release.songsCount} songs",
                                style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor)),
                          ] else if (release is Song) ...[
                            TextSpan(
                                text: release.durationInSeconds.formatSecondsToDuration(),
                                style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor)),
                          ],
                        ]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Text(activity.release.author, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ]),
        if (activity.review.text.isNotEmpty) ...[
          const Divider(),
          const SizedBox(height: 2),
          ExpandableText(
            activity.review.text,
            style: TextStyle(color: Theme.of(context).hintColor),
            expandText: AppLocalizations.of(context)!.readMore,
            maxLines: 5,
          ),
        ]
      ]),
    );
  }
}
