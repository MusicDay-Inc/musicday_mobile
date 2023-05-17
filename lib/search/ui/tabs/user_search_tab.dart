import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/profiles/ui/widgets/user_item_widget.dart';

class UserSearchTab extends StatefulWidget {
  final String query;

  const UserSearchTab({
    super.key,
    required this.query,
  });

  @override
  State<UserSearchTab> createState() => _UserSearchTabState();
}

class _UserSearchTabState extends State<UserSearchTab> {
  late final PagedResponse<User> _response;

  @override
  void initState() {
    _response = getIt.get<UsersRepository>().searchUsers(widget.query);
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
        var itemsCount = state.isLoading ? state.items.length + 1 : state.items.length;
        if (widget.query.trim().isEmpty) {
          itemsCount = 0;
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
              _response.loadMore();
            }

            return true;
          },
          child: ListView.builder(
            itemCount: itemsCount,
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
    );
  }

  @override
  void dispose() {
    _response.dispose();
    super.dispose();
  }
}
