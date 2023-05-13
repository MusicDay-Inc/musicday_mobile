import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/profiles/models/user.dart';

class UserItemWidget extends StatelessWidget {
  final User user;

  const UserItemWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(children: [
        AvatarWidget(size: 22, avatarUrl: user.avatarUrl),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.nickname, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text.rich(TextSpan(children: [
              TextSpan(text: "@${user.username}", style: TextStyle(color: Theme.of(context).hintColor)),
              const WidgetSpan(child: SizedBox(width: 6)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                ),
              ),
              const WidgetSpan(child: SizedBox(width: 6)),
              TextSpan(
                text: "${user.subscriberAmount} subscribers",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ])),
          ],
        ),
      ]),
    );
  }
}
