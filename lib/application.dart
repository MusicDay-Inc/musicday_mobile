import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/ui/auth_container.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_theme.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    configureDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RatingStarsTheme(
      starsColor: Colors.orange,
      child: MaterialApp(
        home: const AuthContainer(),
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale("en", "US")],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.blue[300],
          dividerTheme: DividerThemeData(color: const Color(0xFF9E8E82).withAlpha(25)),
        ),
      ),
    );
  }
}
