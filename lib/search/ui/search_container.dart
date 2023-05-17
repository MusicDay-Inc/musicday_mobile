import 'package:flutter/material.dart';
import 'package:musicday_mobile/search/ui/tabs/release_search_tab.dart';
import 'package:musicday_mobile/search/ui/tabs/user_search_tab.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final _searchBarController = TextEditingController();

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() => setState(() => _searchBarController.clear()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: SearchBar(
              controller: _searchBarController,
              constraints: const BoxConstraints(maxHeight: 46),
              leading: const Padding(padding: EdgeInsets.only(left: 8.0), child: Icon(Icons.search)),
              hintText: "Search query ...",
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          bottom: TabBar(controller: _controller, tabs: const [
            Tab(text: "Users"),
            Tab(text: "Albums"),
            Tab(text: "Songs"),
          ]),
        ),
        body: TabBarView(controller: _controller, physics: const NeverScrollableScrollPhysics(), children: [
          UserSearchTab(
            key: ValueKey("users_search_${_searchBarController.text.toString()}"),
            query: _searchBarController.text.toString(),
          ),
          ReleaseSearchTab(
            key: ValueKey("users_albums_${_searchBarController.text.toString()}"),
            query: _searchBarController.text.toString(),
            onlyAlbums: true,
          ),
          ReleaseSearchTab(
            key: ValueKey("users_songs_${_searchBarController.text.toString()}"),
            query: _searchBarController.text.toString(),
            onlyAlbums: false,
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchBarController.dispose();
    super.dispose();
  }
}
