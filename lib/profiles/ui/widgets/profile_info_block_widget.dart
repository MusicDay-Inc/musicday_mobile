import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/models/user_info.dart';

class ProfileInfoBlockWidget extends StatelessWidget {
  final User user;
  final UserInfo userInfo;
  final VoidCallback? onSubscribe;
  final VoidCallback? onUnsubscribe;
  final VoidCallback? onAvatarClick;

  const ProfileInfoBlockWidget({
    super.key,
    required this.user,
    required this.userInfo,
    this.onSubscribe,
    this.onUnsubscribe,
    this.onAvatarClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(width: 16),
        GestureDetector(onTap: onAvatarClick, child: AvatarWidget(size: 46, avatarUrl: user.avatarUrl)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(user.nickname, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        userInfo.bio,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed("subscribers_list", arguments: user.id),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text("${user.subscriberAmount} subscribers"),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                    const SizedBox(width: 3),
                    InkWell(
                        onTap: () => Navigator.of(context).pushNamed("subscriptions_list", arguments: user.id),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text("${user.subscriptionsAmount} subscriptions"),
                        )),
                  ],
                ),
                if (onSubscribe != null || onUnsubscribe != null) ...[
                  const SizedBox(height: 3),
                  if (onSubscribe != null) ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: FilledButton(
                        onPressed: onSubscribe,
                        style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size.fromHeight(32))),
                        child: const Text("Subscribe"),
                      ),
                    ),
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: OutlinedButton(
                        onPressed: onUnsubscribe,
                        style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size.fromHeight(32))),
                        child: const Text("Unsubscribe"),
                      ),
                    ),
                  ]
                ],
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
