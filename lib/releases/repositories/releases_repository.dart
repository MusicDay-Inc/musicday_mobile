import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/models/song.dart';

abstract class ReleasesRepository {
  /// Выдает поток c информацией о комментарии и песне.
  Stream<Pair<Song, Review?>?> getSongById(String id);

  /// Выдает поток c информацией о комментарии и альбоме.
  Stream<Pair<Album, Review?>?> getAlbumById(String id);

  /// Отправляет ревью на песню.
  Future<bool> sendSongReview(String id, int score, {String? comment});

  /// Отправляет ревью на альбом.
  Future<bool> sendAlbumReview(String id, int score, {String? comment});

  /// Удаляет ревью альбома.
  Future<bool> removeAlbumReview(String reviewId);

  /// Удаляет ревью песни.
  Future<bool> removeSongReview(String reviewId);

  /// Освобождает занятые ресурсы.
  Future<void> dispose();
}
