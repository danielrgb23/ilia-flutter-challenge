import 'package:ilia_movies/apis/now_playing_movies/data/models/data_movie_now_playing_entity_model.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/repository/movie_now_playing_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';

class MovieNowPlayingRepositoryImpl implements MovieNowPlayingRepository {
  final DataSource dataSource;

  MovieNowPlayingRepositoryImpl(this.dataSource);

  @override
  Future<List<MovieEntity>> call() async {
    return await dataSource(fromJson: (json) => DataMovieNowPlayingEntityModel.fromJson(json));
  }
}