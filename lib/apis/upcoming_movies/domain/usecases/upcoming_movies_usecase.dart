import 'package:ilia_movies/apis/upcoming_movies/domain/repository/upcoming_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class UpcomingMoviesUsecase {
  Future<List<MovieEntity>> call();
}

class UpcomingMoviesUsecaseImpl implements UpcomingMoviesUsecase {
  final UpcomingMoviesRepository repository;

  UpcomingMoviesUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}