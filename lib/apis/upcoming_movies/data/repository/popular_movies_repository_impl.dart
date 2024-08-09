import 'package:ilia_movies/apis/top_rated_movies/data/models/data_top_rated_movies_entity_model.dart';
import 'package:ilia_movies/apis/top_rated_movies/domain/repository/top_rated_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';

class TopRatedMovieRepositoryImpl implements TopRatedMoviesRepository {
  final DataSource dataSource;

  TopRatedMovieRepositoryImpl(this.dataSource);

  @override
  Future<List<MovieEntity>> call() async {
    return await dataSource(fromJson: (json) => DataTopRatedMoviesEntityModel.fromJson(json));
  }
}