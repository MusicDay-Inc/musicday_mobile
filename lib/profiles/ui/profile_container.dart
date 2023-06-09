import 'package:flutter/material.dart';
import 'package:musicday_mobile/profiles/ui/subscribers_list/subscribers_list_screen.dart';

class ProfileContainer extends StatefulWidget {
  final String? userId;

  const ProfileContainer({
    super.key,
    this.userId,
  });

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return SubscribersListScreen(id: widget.userId!, showSubscribers: true);
  }
}
