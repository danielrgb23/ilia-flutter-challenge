import 'package:ilia_movies/models/movie_entity.dart';

abstract class PopularMoviesRepository {
  Future<List<MovieEntity>> call();
}
