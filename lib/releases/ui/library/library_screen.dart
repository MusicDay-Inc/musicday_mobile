import 'package:flutter/material.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/ui/library/list/library_list.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _typeNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
        centerTitle: true,
        actions: [
          ValueListenableBuilder(
            valueListenable: _typeNotifier,
            builder: (context, value, _) {
              return PopupMenuButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onSelected: (value) => _typeNotifier.value = value,
                itemBuilder: (BuildContext context) {
                  return [
                    CheckedPopupMenuItem(value: 0, checked: value == 0, child: const Text("Show all")),
                    CheckedPopupMenuItem(value: 1, checked: value == 1, child: const Text("Show albums")),
                    CheckedPopupMenuItem(value: 2, checked: value == 2, child: const Text("Show songs")),
                  ];
                },
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _typeNotifier,
        builder: (context, value, _) {
          Future<PagedResponse<Activity>> getResponse;
          if (value == 0) {
            getResponse = getIt
                .get<AuthSessionRepository>()
                .getCurrentUserId()
                .then((value) => getIt.get<UsersRepository>().getActivities(value!));
          } else if (value == 1) {
            getResponse = getIt
                .get<AuthSessionRepository>()
                .getCurrentUserId()
                .then((value) => getIt.get<UsersRepository>().getOnlyAlbumActivities(value!));
          } else {
            getResponse = getIt
                .get<AuthSessionRepository>()
                .getCurrentUserId()
                .then((value) => getIt.get<UsersRepository>().getOnlySongActivities(value!));
          }

          return LibraryList(getResponse: getResponse);
        },
      ),
    );
  }

  @override
  void dispose() {
    _typeNotifier.dispose();
    super.dispose();
  }
}
