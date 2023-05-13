import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/releases/models/release.dart';
import 'package:musicday_mobile/releases/repositories/releases_repository.dart';
import 'package:musicday_mobile/releases/ui/widgets/release_small_item_widget.dart';

class ReleaseSearchTab extends StatefulWidget {
  final String query;
  final bool onlyAlbums;

  const ReleaseSearchTab({
    super.key,
    required this.query,
    required this.onlyAlbums,
  });

  @override
  State<ReleaseSearchTab> createState() => _ReleaseSearchTabState();
}

class _ReleaseSearchTabState extends State<ReleaseSearchTab> {
  late final PagedResponse<Release> _response;

  @override
  void initState() {
    _response = widget.onlyAlbums
        ? getIt.get<ReleasesRepository>().searchAlbums(widget.query)
        : getIt.get<ReleasesRepository>().searchSongs(widget.query);
    _response.loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _response.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData || (snapshot.data!.isLoading && snapshot.data!.items.isEmpty)) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 90.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final state = snapshot.data!;
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
              _response.loadMore();
            }

            return true;
          },
          child: ListView.builder(
            itemCount: state.isLoading ? state.items.length + 1 : state.items.length,
            itemBuilder: (context, index) {
              if (index == state.items.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ReleastSmallItemWidget(release: state.items[index]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(height: 1),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _response.dispose();
    super.dispose();
  }
}
