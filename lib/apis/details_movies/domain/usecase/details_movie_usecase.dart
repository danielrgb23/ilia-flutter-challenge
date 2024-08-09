import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/apis/details_movies/domain/repository/details_movie_repository.dart';

abstract class DetailsMovieUsecase {
  Future<DetailsMovieEntity> call(String movieId);
}

class DetailsMovieUsecaseImpl implements DetailsMovieUsecase {
  final DetailsMovieRepository repository;

  DetailsMovieUsecaseImpl(this.repository);

  @override
  Future<DetailsMovieEntity> call(String movieId) async {
    return await repository(movieId);
  }
}