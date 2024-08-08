import 'package:ilia_movies/apis/now_playing_movies/domain/repository/movie_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class MovieUsecase {
  Future<List<MovieEntity>> call();
}

class MovieUsecaseImpl implements MovieUsecase {
  final MovieRepository repository;

  MovieUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}