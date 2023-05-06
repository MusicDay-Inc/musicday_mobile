import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/ui/song_info/song_info_state.dart';

@Injectable()
class SongInfoBloc extends Cubit<SongInfoState> {
  final Logger _logger;

  SongInfoBloc({
    @factoryParam required String songId,
    required LoggerFactory loggerFactory,
  })  : _logger = loggerFactory.create("SongInfoBloc"),
        super(const SongInfoState.loading()) {
    _logger.debug("init, songId = $songId");

    emit(
      SongInfoState.data(Song(
        id: songId,
        name: "Don't Stand So Close to Me",
        author: "The Police",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/7/7b/Don%27t_Stand_So_Close_to_Me_UK.jpg/220px-Don%27t_Stand_So_Close_to_Me_UK.jpg",
        duration: 650,
        year: 1970,
      )),
    );
  }
}
