import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';

abstract class DetailsMovieRepository {
  Future<DetailsMovieEntity> call(String movieId);
}