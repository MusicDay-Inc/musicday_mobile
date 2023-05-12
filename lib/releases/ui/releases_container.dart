import 'package:flutter/material.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_screen.dart';

class ReleasesContainer extends StatefulWidget {
  const ReleasesContainer({super.key});

  @override
  State<StatefulWidget> createState() => _ReleasesContainerState();
}

class _ReleasesContainerState extends State<ReleasesContainer> {
  @override
  Widget build(BuildContext context) {
    return const SongInfoScreen(songId: "bc89401b-5a45-4f44-80bf-7118bed427c8", isSong: false);
  }
}
