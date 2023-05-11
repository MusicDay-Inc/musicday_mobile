import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/releases/repositories/releases_repository.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_state.dart';

@Injectable()
class SongInfoBloc extends Cubit<SongInfoState> {
  final Logger _logger;
  final String songId;
  final bool isSong;
  final ReleasesRepository releasesRepository;
  late StreamSubscription _subscription;

  SongInfoBloc({
    @factoryParam required this.songId,
    @factoryParam required this.isSong,
    required this.releasesRepository,
    required LoggerFactory loggerFactory,
  })  : _logger = loggerFactory.create("SongInfoBloc"),
        super(const SongInfoState.loading()) {
    _logger.debug("init: songId = $songId, isSong = $isSong");

    if (isSong) {
      _subscription = releasesRepository.getSongById(songId).listen((event) {
        if (event == null) {
          _logger.debug("init, getSongById: event == null");
          return;
        }

        _logger.debug("init, getSongById: event != null");
        emit(SongInfoState.data(event.first, event.second));
      });
    } else {
      _subscription = releasesRepository.getAlbumById(songId).listen((event) {
        if (event == null) {
          _logger.debug("init, getAlbumById: event == null");
          return;
        }

        _logger.debug("init, getAlbumById: event != null");
        emit(SongInfoState.data(event.first, event.second));
      });
    }
  }

  /// Отправляет запрос на удаление ревью.
  Future<void> removeReview(String reviewId) async {
    _logger.debug("removeReview($reviewId)");

    if (!isSong) {
      await releasesRepository.removeAlbumReview(reviewId);
    } else {
      await releasesRepository.removeSongReview(reviewId);
    }
  }

  @override
  Future<void> close() async {
    _logger.debug("close()");
    await _subscription.cancel();
    return await super.close();
  }
}
