import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.config.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<StatefulWidget> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  void initState() {
    initAuthScope(getIt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onPopPage: (route, result) => result,
        pages: const [
          MaterialPage(child: IntroScreen()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    getIt.popScope();
    super.dispose();
  }
}
