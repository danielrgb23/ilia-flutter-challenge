import 'package:ilia_movies/apis/top_rated_movies/domain/repository/top_rated_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class TopRatedMoviesUsecase {
  Future<List<MovieEntity>> call();
}

class TopRatedMoviesUsecaseImpl implements TopRatedMoviesUsecase {
  final TopRatedMoviesRepository repository;

  TopRatedMoviesUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}