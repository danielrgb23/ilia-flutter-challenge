
import 'package:ilia_movies/apis/popular_movies/domain/repository/popular_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class PopularMoviesUsecase {
  Future<List<MovieEntity>> call();
}

class PopularMoviesUsecaseImpl implements PopularMoviesUsecase {
  final PopularMoviesRepository repository;

  PopularMoviesUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}