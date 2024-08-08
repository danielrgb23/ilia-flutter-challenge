import 'package:ilia_movies/models/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> call();
}
