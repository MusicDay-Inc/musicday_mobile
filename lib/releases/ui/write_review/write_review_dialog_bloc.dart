import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/releases/repositories/releases_repository.dart';
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_event.dart';
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_state.dart';

@Injectable()
class WriteReviewDialogBloc extends Bloc<WriteReviewDialogEvent, WriteReviewDialogState> {
  final String id;
  final Logger _logger;

  WriteReviewDialogBloc({
    @factoryParam required this.id,
    required LoggerFactory loggerFactory,
    required ReleasesRepository releasesRepository,
  })  : _logger = loggerFactory.create("WriteReviewDialogBloc"),
        super(const WriteReviewDialogState.initial()) {
    _logger.debug("init");
    on<WriteReviewDialogEvent>((event, emit) async {
      await event.when(submit: (rating, comment) async {
        _logger.debug("init, received submit($rating, $comment)");
        emit(const WriteReviewDialogState.loading());

        if (await releasesRepository.sendSongReview(id, rating, comment: comment)) {
          _logger.debug("init, submit: success");
          emit(const WriteReviewDialogState.success());
        } else {
          _logger.debug("init, submit: serverError");
          emit(const WriteReviewDialogState.serverError());
        }
      });
    });
  }
}
