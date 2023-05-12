import 'package:flutter/material.dart';
import 'package:musicday_mobile/core/ui/avatars/avatar_widget.dart';
import 'package:musicday_mobile/profiles/models/user.dart';

class ProfileInfoBlockWidget extends StatelessWidget {
  final User user;

  const ProfileInfoBlockWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(width: 16),
        const AvatarWidget(size: 46),
        const SizedBox(width: 16),
        Expanded(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.nickname, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Row(children: [
                  Expanded(
                    child: Text(
                      "Senior android dev at SberDevices, HSE FCS, 19yo, @kotlinovsky",
                      style: TextStyle(fontSize: 14),
                      maxLines: 2,
                    ),
                  ),
                ]),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${user.subscriberAmount} subscribers"),
                    const SizedBox(width: 6),
                    Icon(Icons.circle, size: 5, color: Theme.of(context).hintColor),
                    const SizedBox(width: 6),
                    Text("${user.subscriptionsAmount} subscriptions"),
                  ],
                )
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
