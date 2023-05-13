import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/ui/auth_container_bloc.dart';
import 'package:musicday_mobile/auth/ui/auth_container_state.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/search/ui/search_container.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<StatefulWidget> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocInject<AuthContainerBloc>(
      getIt: getIt,
      child: Scaffold(
        body: BlocBuilder<AuthContainerBloc, AuthContainerState>(
          builder: (context, state) {
            return state.when(
              loading: () => Container(),
              nonAuthorized: () => _buildAuthNavigator(context, false),
              inRegistration: () => _buildAuthNavigator(context, true),
              authorized: () => const SearchContainer(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAuthNavigator(BuildContext context, bool isSessionExists) {
    return Navigator(
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        BlocProvider.of<AuthContainerBloc>(context).onSessionClosed();
        return true;
      },
      pages: [
        const MaterialPage(child: IntroScreen()),
        if (isSessionExists) ...[
          const MaterialPage(child: SignUpScreen()),
        ]
      ],
    );
  }
}
