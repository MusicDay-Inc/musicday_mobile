import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:musicday_mobile/application_di.dart';
import 'package:musicday_mobile/core/di/bloc_inject.dart';
import 'package:musicday_mobile/core/ui/dialogs/message_dialog.dart';
import 'package:musicday_mobile/releases/ui/widgets/rating_stars_widget.dart';
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_bloc.dart';
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_event.dart';
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_state.dart';

class WriteReviewDialog extends StatefulWidget {
  final String releaseId;

  const WriteReviewDialog({
    super.key,
    required this.releaseId,
  });

  static void open(BuildContext context, String releaseId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => WriteReviewDialog(releaseId: releaseId),
    );
  }

  @override
  State<StatefulWidget> createState() => _WriteReviewDialogState();
}

class _WriteReviewDialogState extends State<WriteReviewDialog> {
  final _ratingNotifier = ValueNotifier<int>(0);
  final _commentInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocInject<WriteReviewDialogBloc>(
      getIt: getIt,
      param1: widget.releaseId,
      child: BlocListener<WriteReviewDialogBloc, WriteReviewDialogState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => Navigator.pop(context),
            serverError: () {
              MessageDialog.show(
                context,
                title: AppLocalizations.of(context)!.authErrorTitle,
                content: AppLocalizations.of(context)!.serverCommunicationError,
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: _ratingNotifier,
                        builder: (context, value, _) {
                          return BlocBuilder<WriteReviewDialogBloc, WriteReviewDialogState>(
                            builder: (context, state) {
                              return RatingStarsWidget(
                                size: 32,
                                total: 5,
                                expanded: true,
                                filled: value,
                                onSelect: state.maybeMap(
                                  orElse: () => (stars) => _ratingNotifier.value = stars,
                                  loading: null,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 28),
                BlocBuilder<WriteReviewDialogBloc, WriteReviewDialogState>(
                  builder: (context, state) {
                    return TextField(
                      minLines: 5,
                      maxLines: 5,
                      maxLength: 2000,
                      controller: _commentInputController,
                      enabled: state.maybeWhen(orElse: () => true, loading: () => false),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        helperText: AppLocalizations.of(context)!.optional,
                        hintText: AppLocalizations.of(context)!.comment,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        child: Text(AppLocalizations.of(context)!.cancel),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ValueListenableBuilder(
                        valueListenable: _ratingNotifier,
                        builder: (context, value, _) {
                          return BlocBuilder<WriteReviewDialogBloc, WriteReviewDialogState>(
                            builder: (context, state) {
                              return FilledButton(
                                onPressed: state.maybeWhen(
                                  loading: () => null,
                                  orElse: () => value > 0
                                      ? () => BlocProvider.of<WriteReviewDialogBloc>(context).add(
                                            WriteReviewDialogEvent.submit(
                                              comment: _commentInputController.text.toString(),
                                              rating: value,
                                            ),
                                          )
                                      : null,
                                ),
                                child: Text(AppLocalizations.of(context)!.submit),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ratingNotifier.dispose();
    _commentInputController.dispose();
    super.dispose();
  }
}
