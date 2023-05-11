import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.config.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_screen.dart';

class ReleasesContainer extends StatefulWidget {
  const ReleasesContainer({super.key});

  @override
  State<StatefulWidget> createState() => _ReleasesContainerState();
}

class _ReleasesContainerState extends State<ReleasesContainer> {
  @override
  void initState() {
    initReleasesScope(getIt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SongInfoScreen(songId: "bc89401b-5a45-4f44-80bf-7118bed427c8", isSong: false);
  }

  @override
  void dispose() {
    getIt.popScope();
    super.dispose();
  }
}
