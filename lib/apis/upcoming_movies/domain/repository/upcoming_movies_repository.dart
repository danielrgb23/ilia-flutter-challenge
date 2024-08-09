import 'package:ilia_movies/models/movie_entity.dart';

abstract class UpcomingMoviesRepository {
  Future<List<MovieEntity>> call();
}
