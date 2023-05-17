import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:musicday_mobile/activity/ui/activity_screen.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_screen.dart';
import 'package:musicday_mobile/profiles/ui/subscribers_list/subscribers_list_screen.dart';
import 'package:musicday_mobile/releases/ui/library/library_screen.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_arguments.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_screen.dart';
import 'package:musicday_mobile/search/ui/search_container.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({
    super.key,
  });

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      savePageState: true,
      lazyLoadPages: true,
      bottomNavigationBar: (current, onTap) {
        return NavigationBar(
          selectedIndex: current,
          onDestinationSelected: onTap,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Activity",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: "Library",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        );
      },
      pages: [
        (key) => _wrapNavigator(key, () => const ActivityScreen()),
        (key) => _wrapNavigator(key, () => const SearchContainer()),
        (key) => _wrapNavigator(key, () => const LibraryScreen()),
        (key) => _wrapNavigator(key, () => const ProfileInfoScreen()),
      ],
    );
  }

  Navigator _wrapNavigator(GlobalKey<NavigatorState> key, Widget Function() provideInitial) {
    // todo: safe args для параметров, либо перейти на go router

    return Navigator(
      key: key,
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (_) => provideInitial());
        } else if (settings.name == "profile") {
          return MaterialPageRoute(builder: (_) => ProfileInfoScreen(userId: settings.arguments as String));
        } else if (settings.name == "song_info") {
          return MaterialPageRoute(builder: (_) => SongInfoScreen(arguments: settings.arguments as SongInfoArguments));
        } else if (settings.name == "subscriptions_list") {
          return MaterialPageRoute(
              builder: (_) => SubscribersListScreen(id: settings.arguments as String, showSubscribers: false));
        } else if (settings.name == "subscribers_list") {
          return MaterialPageRoute(
              builder: (_) => SubscribersListScreen(id: settings.arguments as String, showSubscribers: true));
        }

        throw UnsupportedError("Unsupported route: $settings");
      },
    );
  }
}
