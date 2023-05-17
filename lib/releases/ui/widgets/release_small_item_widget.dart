import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/release.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_arguments.dart';

class ReleastSmallItemWidget extends StatelessWidget {
  final Release release;

  const ReleastSmallItemWidget({
    super.key,
    required this.release,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "song_info",
          arguments: SongInfoArguments(songId: release.id, isSong: release is Song)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(children: [
          AvatarWidget(size: 22, avatarUrl: release.avatarUrl),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(release.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text.rich(TextSpan(children: [
                TextSpan(text: release.author, style: TextStyle(color: Theme.of(context).hintColor)),
                const WidgetSpan(child: SizedBox(width: 6)),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 6)),
                TextSpan(
                  text: "${release.year}",
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
                const WidgetSpan(child: SizedBox(width: 6)),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 6)),
                if (release is Album) ...[
                  TextSpan(
                    text: "${(release as Album).songsCount} songs",
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                ] else if (release is Song) ...[
                  TextSpan(
                    text: (release as Song).durationInSeconds.formatSecondsToDuration(),
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                ]
              ])),
            ],
          ),
        ]),
      ),
    );
  }
}
