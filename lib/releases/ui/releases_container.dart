import 'package:flutter/material.dart';
import 'package:musicday_mobile/releases/ui/library/library_screen.dart';

class ReleasesContainer extends StatefulWidget {
  const ReleasesContainer({super.key});

  @override
  State<StatefulWidget> createState() => _ReleasesContainerState();
}

class _ReleasesContainerState extends State<ReleasesContainer> {
  @override
  Widget build(BuildContext context) {
    return const LibraryScreen();
  }
}
