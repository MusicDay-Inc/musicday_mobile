import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.config.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_screen.dart';

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
  void initState() {
    initProfileScope(getIt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileInfoScreen(userId: widget.userId);
  }

  @override
  void dispose() {
    getIt.popScope();
    super.dispose();
  }
}
