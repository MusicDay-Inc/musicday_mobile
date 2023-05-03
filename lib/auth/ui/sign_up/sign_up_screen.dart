import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_bloc.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_event.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_state.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/core/ui/dialogs/message_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nicknameController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocInject<SignUpScreenBloc>(
      getIt: getIt,
      child: BlocListener<SignUpScreenBloc, SignUpScreenState>(
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
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.signUpTitle),
            actions: [
              BlocBuilder<SignUpScreenBloc, SignUpScreenState>(builder: (context, state) {
                return TextButton(
                  onPressed: state.whenOrNull(
                    idle: () => () => _handleDoneButtonClick(context),
                    serverError: () => () => _handleDoneButtonClick(context),
                    invalidFormat: (f, s) => () => _handleDoneButtonClick(context),
                  ),
                  child: Text(AppLocalizations.of(context)!.done),
                );
              })
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.signUpWelcome, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 24),
                BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
                  builder: (context, state) {
                    return TextField(
                      enabled: state.maybeWhen(loading: () => false, orElse: () => true),
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.nickname,
                        hintText: "Maxim Mityushkin",
                        errorText: state.maybeWhen(
                          orElse: () => null,
                          invalidFormat: (isNicknameInvalid, _) => isNicknameInvalid ? "Invalid format!" : null,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                BlocBuilder<SignUpScreenBloc, SignUpScreenState>(
                  builder: (context, state) {
                    return TextField(
                      enabled: state.maybeWhen(loading: () => false, orElse: () => true),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "kotlinovsky",
                        prefix: const Text("@"),
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.username,
                        errorText: state.maybeWhen(
                          orElse: () => null,
                          invalidFormat: (_, isUsernameInvalid) => isUsernameInvalid ? "Invalid format!" : null,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleDoneButtonClick(BuildContext context) {
    BlocProvider.of<SignUpScreenBloc>(context)
        .add(SignUpScreenEvent.doneClick(_nicknameController.text, _usernameController.text));
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
