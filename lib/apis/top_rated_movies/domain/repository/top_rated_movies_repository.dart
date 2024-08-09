import 'package:ilia_movies/models/movie_entity.dart';

abstract class TopRatedMoviesRepository {
  Future<List<MovieEntity>> call();
}
