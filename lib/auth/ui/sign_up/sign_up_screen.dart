import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUpTitle),
        actions: [
          TextButton(
            child: Text(AppLocalizations.of(context)!.done),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.signUpWelcome, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.nickname,
                hintText: "Maxim Mityushkin",
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                prefix: const Text("@"),
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.username,
                hintText: "kotlinovsky",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
