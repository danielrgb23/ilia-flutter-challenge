import 'package:ilia_movies/apis/upcoming_movies/data/models/data_upcoming_movies_entity_model.dart';
import 'package:ilia_movies/apis/upcoming_movies/domain/repository/upcoming_movies_repository.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';

class UpcomingMovieRepositoryImpl implements UpcomingMoviesRepository {
  final DataSource dataSource;

  UpcomingMovieRepositoryImpl(this.dataSource);

  @override
  Future<List<MovieEntity>> call() async {
    return await dataSource(fromJson: (json) => DataUpcomingMoviesEntityModel.fromJson(json));
  }
}