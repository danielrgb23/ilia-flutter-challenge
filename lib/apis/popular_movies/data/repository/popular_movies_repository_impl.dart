import 'package:ilia_movies/apis/popular_movies/data/models/data_popular_movies_entity_model.dart';
import 'package:ilia_movies/apis/popular_movies/domain/repository/popular_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';

class PopularMovieRepositoryImpl implements PopularMoviesRepository {
  final DataSource dataSource;

  PopularMovieRepositoryImpl(this.dataSource);

  @override
  Future<List<MovieEntity>> call() async {
    return await dataSource(fromJson: (json) => DataPopularMoviesEntityModel.fromJson(json));
  }
}