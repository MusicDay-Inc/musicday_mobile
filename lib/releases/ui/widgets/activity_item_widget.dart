import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/formatting/date_formatting_extensions.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_arguments.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityItemWidget extends StatelessWidget {
  final User user;
  final Activity activity;
  final bool canSelectUser;

  const ActivityItemWidget({
    super.key,
    required this.user,
    required this.activity,
    this.canSelectUser = true,
  });

  @override
  Widget build(BuildContext context) {
    final release = activity.release;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: canSelectUser ? () => Navigator.pushNamed(context, "profile", arguments: user.id) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(children: [
            AvatarWidget(size: 17, avatarUrl: user.avatarUrl),
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
        ),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Divider(height: 1)),
      InkWell(
        onTap: () => Navigator.pushNamed(context, "song_info",
            arguments: SongInfoArguments(songId: activity.release.id, isSong: activity.release is Song)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          child: Row(children: [
            Container(
              width: 32,
              height: 34,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: release.avatarUrl == null ? Theme.of(context).colorScheme.primaryContainer : null,
                borderRadius: BorderRadius.circular(4),
              ),
              child: release.avatarUrl != null ? Image.network(release.avatarUrl!) : null,
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
        ),
      ),
      if (activity.review.text.isNotEmpty) ...[
        const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Divider(height: 1)),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
          child: ExpandableText(
            activity.review.text,
            style: TextStyle(color: Theme.of(context).hintColor),
            expandText: AppLocalizations.of(context)!.readMore,
            maxLines: 5,
          ),
        ),
      ]
    ]);
  }
}
