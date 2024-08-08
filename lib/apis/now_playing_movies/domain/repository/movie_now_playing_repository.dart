import 'package:ilia_movies/models/movie_entity.dart';

abstract class MovieNowPlayingRepository {
  Future<List<MovieEntity>> call();
}
