import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/ui/widgets/activity_item_widget.dart';

class ActivityList extends StatefulWidget {
  final Future<PagedResponse<UserActivity>> activityFuture;

  const ActivityList({
    super.key,
    required this.activityFuture,
  });

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.activityFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final response = snapshot.data!;
        snapshot.data!.loadMore();
        return StreamBuilder(
          stream: snapshot.data!.state,
          builder: (context, snapshot) {
            if (!snapshot.hasData || (snapshot.data!.isLoading && snapshot.data!.items.isEmpty)) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 60.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
                  response.loadMore();
                }

                return true;
              },
              child: ListView.builder(
                itemCount: snapshot.data!.isLoading ? snapshot.data!.items.length + 1 : snapshot.data!.items.length,
                itemBuilder: (context, index) {
                  if (snapshot.data!.items.length == index && snapshot.data!.isLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Center(
                          child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                    );
                  }

                  return Column(children: [
                    const SizedBox(height: 12),
                    ActivityItemWidget(
                      user: snapshot.data!.items[index].user,
                      activity: snapshot.data!.items[index].activity,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: Theme.of(context).dividerColor.withAlpha(50),
                        height: 4,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
