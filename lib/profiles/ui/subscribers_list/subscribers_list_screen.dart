import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/profiles/ui/widgets/user_item_widget.dart';

class SubscribersListScreen extends StatefulWidget {
  final String id;
  final bool showSubscribers;

  const SubscribersListScreen({
    super.key,
    required this.id,
    required this.showSubscribers,
  });

  @override
  State<SubscribersListScreen> createState() => _SubscribersListScreenState();
}

class _SubscribersListScreenState extends State<SubscribersListScreen> {
  late PagedResponse<User> _pagedResponse;

  @override
  void initState() {
    if (widget.showSubscribers) {
      _pagedResponse = getIt.get<UsersRepository>().getSubscribers(widget.id);
    } else {
      _pagedResponse = getIt.get<UsersRepository>().getSubscriptions(widget.id);
    }

    _pagedResponse.loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.showSubscribers ? "Subscribers" : "Subscriptions")),
      body: StreamBuilder(
        stream: _pagedResponse.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final state = snapshot.data!;
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
                _pagedResponse.loadMore();
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
                    UserItemWidget(user: state.items[index]),
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
      ),
    );
  }

  @override
  void dispose() {
    _pagedResponse.dispose();
    super.dispose();
  }
}
