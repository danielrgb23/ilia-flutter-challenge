import 'package:ilia_movies/apis/top_rated_movies/data/models/data_top_rated_movies_entity_model.dart';
import 'package:ilia_movies/models/movie_list_entity.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataTopRatedMoviesListModel extends MovieListEntity implements Model {
  DataTopRatedMoviesListModel(
    final List<MovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataTopRatedMoviesEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataTopRatedMoviesListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"]["results"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataTopRatedMoviesListModel(
      dataList.map((dataJson) => DataTopRatedMoviesEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataTopRatedMoviesListModel.copy(MovieListEntity movieListEntity) {
    return DataTopRatedMoviesListModel(
      movieListEntity.data,
    );
  }
}
