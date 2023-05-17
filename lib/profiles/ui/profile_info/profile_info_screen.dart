import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/profiles/interactors/avatar_upload_interactor.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_bloc.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_event.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_state.dart';
import 'package:musicday_mobile/profiles/ui/widgets/profile_info_block_widget.dart';
import 'package:musicday_mobile/releases/ui/widgets/activity_item_widget.dart';

class ProfileInfoScreen extends StatefulWidget {
  final String? userId;

  const ProfileInfoScreen({
    super.key,
    this.userId,
  });

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocInject<ProfileInfoBloc>(
      getIt: getIt,
      param1: widget.userId,
      child: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.when(loading: () => "...", data: (user, f, s, t) => "@${user.username}")),
            centerTitle: true,
            actions: [
              if (widget.userId == null)
                IconButton(
                  onPressed: () => BlocProvider.of<ProfileInfoBloc>(context).add(const ProfileInfoEvent.logOut()),
                  icon: const Icon(Icons.logout),
                )
            ],
          ),
          body: state.when(loading: () {
            return const Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }, data: (user, reviews, isLoading, info) {
            var itemsCount = 4;

            if (reviews.isEmpty && isLoading) {
              itemsCount++;
            } else if (reviews.isNotEmpty) {
              itemsCount += 1 + reviews.length;
              if (isLoading) {
                itemsCount++;
              }
            }

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
                  BlocProvider.of<ProfileInfoBloc>(context).add(const ProfileInfoEvent.loadMore());
                }

                return true;
              },
              child: ListView.builder(
                itemCount: itemsCount,
                padding: const EdgeInsets.only(bottom: 32),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ProfileInfoBlockWidget(
                      user: user,
                      userInfo: info,
                      onAvatarClick: widget.userId == null
                          ? () => getIt.get<AvatarUploadInteractor>().startAvatarUpload(user.id)
                          : null,
                      onSubscribe: widget.userId != null && !info.isSubscribed
                          ? () => BlocProvider.of<ProfileInfoBloc>(context).add(const ProfileInfoEvent.subscribe())
                          : null,
                      onUnsubscribe: widget.userId != null && info.isSubscribed
                          ? () => BlocProvider.of<ProfileInfoBloc>(context).add(const ProfileInfoEvent.unsubscribe())
                          : null,
                    );
                  } else if (index == 1) {
                    return const Padding(padding: EdgeInsets.only(left: 16, right: 16), child: Divider());
                  } else if (index == 2) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          Text("${info.songAmount} rated songs", style: TextStyle(color: Theme.of(context).hintColor)),
                          const SizedBox(width: 6),
                          Icon(Icons.circle, size: 4, color: Theme.of(context).hintColor),
                          const SizedBox(width: 7),
                          Text("${info.albumAmount} rated albums",
                              style: TextStyle(color: Theme.of(context).hintColor)),
                        ],
                      ),
                    );
                  } else if (index == 3) {
                    return const Padding(padding: EdgeInsets.only(left: 16, right: 16), child: Divider());
                  } else if (index == 4 && reviews.isNotEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
                      child: Text("Activity", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    );
                  }

                  if (itemsCount == index + 1 && isLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Center(
                          child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                    );
                  }

                  return Column(children: [
                    const SizedBox(height: 12),
                    ActivityItemWidget(user: user, activity: reviews[index - 5], canSelectUser: false),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: Theme.of(context).dividerColor.withAlpha(50),
                        height: 4,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ]);
                },
              ),
            );
          }),
        );
      }),
    );
  }
}
