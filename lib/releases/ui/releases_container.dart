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
    return const SongInfoScreen(songId: "bcba17a9-f724-4641-a881-80c223fe8e6b");
  }

  @override
  void dispose() {
    getIt.popScope();
    super.dispose();
  }
}
