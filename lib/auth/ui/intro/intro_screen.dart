import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen_event.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen_state.dart';
import 'package:musicday_mobile/auth/ui/widgets/google_sign_in_button.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/core/ui/dialogs/message_dialog.dart';
import 'package:musicday_mobile/core/ui/images_assets.dart';

const double _faviconSize = 148;

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocInject<IntroScreenBloc>(
      getIt: getIt,
      child: BlocListener<IntroScreenBloc, IntroScreenState>(
        listener: (context, state) {
          state.whenOrNull(serverError: () {
            MessageDialog.show(
              context,
              title: AppLocalizations.of(context)!.authErrorTitle,
              content: AppLocalizations.of(context)!.serverCommunicationError,
            );
          });
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: _faviconSize / 2),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: Image.asset(
                          ImagesAssets.favicon,
                          height: _faviconSize,
                          width: _faviconSize,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<IntroScreenBloc, IntroScreenState>(builder: (context, state) {
                            return GoogleSignInButton(
                              onAuthComplete: state.whenOrNull(
                                serverError: () => () => _handleGoogleButtonClick(context),
                                idle: () => () => _handleGoogleButtonClick(context),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleGoogleButtonClick(BuildContext context) {
    BlocProvider.of<IntroScreenBloc>(context).add(
      const IntroScreenEvent.googleButtonClick(),
    );
  }
}
