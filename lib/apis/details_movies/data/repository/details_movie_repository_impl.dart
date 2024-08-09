import 'package:ilia_movies/apis/details_movies/data/model/data_details_movie_entity_model.dart';
import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/apis/details_movies/domain/repository/details_movie_repository.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';

class DetailsMovieRepositoryImpl implements DetailsMovieRepository {
  final DataSource dataSource;

  DetailsMovieRepositoryImpl(this.dataSource);

  @override
  Future<DetailsMovieEntity> call(String movieId) async {
    Map<String, dynamic> param = {};

    param["movieId"] = movieId;

    return await dataSource(
      param: param,
        fromJson: (json) => DataDetailsMovieEntityModel.fromJson(json));
  }
}
