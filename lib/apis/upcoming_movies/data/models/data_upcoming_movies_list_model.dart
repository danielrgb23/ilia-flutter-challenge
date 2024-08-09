import 'package:ilia_movies/apis/upcoming_movies/data/models/data_upcoming_movies_entity_model.dart';
import 'package:ilia_movies/models/movie_list_entity.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataUpcomingMoviesListModel extends MovieListEntity implements Model {
  DataUpcomingMoviesListModel(
    final List<MovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataUpcomingMoviesEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataUpcomingMoviesListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"]["results"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataUpcomingMoviesListModel(
      dataList.map((dataJson) => DataUpcomingMoviesEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataUpcomingMoviesListModel.copy(MovieListEntity movieListEntity) {
    return DataUpcomingMoviesListModel(
      movieListEntity.data,
    );
  }
}
