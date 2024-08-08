import 'package:ilia_movies/apis/now_playing_movies/domain/repository/movie_now_playing_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class MovieNowPlayingUsecase {
  Future<List<MovieEntity>> call();
}

class MovieUsecaseImpl implements MovieNowPlayingUsecase {
  final MovieNowPlayingRepository repository;

  MovieUsecaseImpl(this.repository);

  @override
  Future<List<MovieEntity>> call() async {
    return await repository();
  }
}