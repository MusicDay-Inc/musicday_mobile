import 'package:flutter/material.dart';
import 'package:musicday_mobile/activity/ui/list/activity_list.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/releases/models/activity.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late Future<PagedResponse<UserActivity>> _activityFuture;

  @override
  void initState() {
    _activityFuture = Future(() => getIt.get<UsersRepository>().getFeed());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Activity"), centerTitle: true),
      body: ActivityList(activityFuture: _activityFuture),
    );
  }
}
