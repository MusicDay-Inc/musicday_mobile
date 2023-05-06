import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? avatarUrl;
  final double size;

  const AvatarWidget({
    super.key,
    required this.size,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      maxRadius: size,
      minRadius: size,
    );
  }
}
