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
  late StreamSubscription _subscription;

  SongInfoBloc({
    @factoryParam required String songId,
    required ReleasesRepository releasesRepository,
    required LoggerFactory loggerFactory,
  })  : _logger = loggerFactory.create("SongInfoBloc"),
        super(const SongInfoState.loading()) {
    _logger.debug("init, songId = $songId");
    _subscription = releasesRepository.getSongById(songId).listen((event) {
      if (event == null) {
        _logger.debug("init, getSongById: event == null");
        return;
      }

      _logger.debug("init, getSongById: event != null");
      emit(SongInfoState.data(event.first, event.second));
    });
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return await super.close();
  }
}
