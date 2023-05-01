import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicday_mobile/core/ui/svg_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoogleSignInButton extends StatelessWidget {
  final void Function()? onAuthComplete;

  const GoogleSignInButton({
    super.key,
    this.onAuthComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(SvgIcons.googleIcon, height: Theme.of(context).buttonTheme.height / 1.75),
      label: Text(AppLocalizations.of(context)!.signInWithGoogle),
      onPressed: onAuthComplete,
    );
  }
}
