import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_bloc.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_state.dart';
import 'package:musicday_mobile/releases/ui/widgets/another_user_review_widget.dart';
import 'package:musicday_mobile/releases/ui/widgets/user_review_widget.dart';

class SongInfoScreen extends StatefulWidget {
  final String songId;

  const SongInfoScreen({
    super.key,
    required this.songId,
  });

  @override
  State<StatefulWidget> createState() => _SongInfoScreenState();
}

class _SongInfoScreenState extends State<SongInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocInject<SongInfoBloc>(
      getIt: getIt,
      param1: widget.songId,
      child: Scaffold(
        body: BlocBuilder<SongInfoBloc, SongInfoState>(builder: (context, state) {
          return state.when(loading: () {
            return const Center(child: CircularProgressIndicator());
          }, data: (song) {
            return CustomScrollView(slivers: [
              SliverAppBar.large(
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: song.avatarUrl != null
                      ? Image.network(song.avatarUrl!, fit: BoxFit.cover)
                      : Container(color: Theme.of(context).hintColor),
                  titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(song.name, style: const TextStyle(fontSize: 16), maxLines: 1),
                      Row(
                        children: [
                          Text(song.author, style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                          ),
                          const SizedBox(width: 4),
                          Text("${song.year}", style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                          ),
                          const SizedBox(width: 4),
                          Text(song.duration.formatSecondsToDuration(), style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index == 0) {
                    return UserReviewWidget(rating: 5, onDeleteClick: () {}, onWriteClick: () {});
                  } else if (index == 1) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.subscriptionsReviews,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Text("2.1", style: TextStyle(color: Theme.of(context).hintColor)),
                          Icon(Icons.star, size: 14, color: Theme.of(context).buttonTheme.colorScheme!.primary),
                        ],
                      ),
                    );
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      AnotherUserReviewWidget(
                        reviewTimestamp: 1683402042,
                        authorId: "Maxim Mityushkin",
                        authorName: "Maxim Mityushkin",
                        authorAvatar: null,
                        comment: "M" * 150,
                        rating: 4,
                      ),
                      const SizedBox(height: 14),
                      if (index < 11)
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Divider(height: 1))
                      else
                        const SizedBox(height: 24),
                    ],
                  );
                }, childCount: 12),
              )
            ]);
          });
        }),
      ),
    );
  }
}
