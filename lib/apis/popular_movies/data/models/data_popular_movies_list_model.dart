import 'package:ilia_movies/models/movie_list_entity.dart';
import 'package:ilia_movies/apis/popular_movies/data/models/data_popular_movies_entity_model.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataPopularMoviesListModel extends MovieListEntity implements Model {
  DataPopularMoviesListModel(
    final List<MovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataPopularMoviesEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataPopularMoviesListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"]["results"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataPopularMoviesListModel(
      dataList.map((dataJson) => DataPopularMoviesEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataPopularMoviesListModel.copy(MovieListEntity movieListEntity) {
    return DataPopularMoviesListModel(
      movieListEntity.data,
    );
  }
}
