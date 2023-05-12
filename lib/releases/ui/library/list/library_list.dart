import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/ui/widgets/release_item_widget.dart';

class LibraryList extends StatefulWidget {
  final Future<PagedResponse<Activity>> getResponse;

  const LibraryList({
    super.key,
    required this.getResponse,
  });

  @override
  State<LibraryList> createState() => _LibraryListState();
}

class _LibraryListState extends State<LibraryList> {
  PagedResponse<Activity>? _response;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getResponse,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        _response = snapshot.data;
        _response!.loadMore();

        return StreamBuilder(
          stream: _response!.state,
          builder: (context, snapshot) {
            if (!snapshot.hasData || (snapshot.data!.items.isEmpty && snapshot.data!.isLoading)) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
                  _response!.loadMore();
                }

                return true;
              },
              child: ListView.builder(
                itemCount: snapshot.data!.isLoading ? snapshot.data!.items.length + 1 : snapshot.data!.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ReleaseItemWidget(activity: snapshot.data!.items[index]),
                      const Divider(),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
