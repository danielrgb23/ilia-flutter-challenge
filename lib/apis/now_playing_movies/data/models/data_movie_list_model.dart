import 'package:ilia_movies/apis/now_playing_movies/data/models/data_movie_entity_model.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/entities/movie_list_entity.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataMovieListModel extends MovieListEntity implements Model {
  DataMovieListModel(
    final List<MovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataMovieEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataMovieListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"]["results"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataMovieListModel(
      dataList.map((dataJson) => DataMovieEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataMovieListModel.copy(MovieListEntity movieListEntity) {
    return DataMovieListModel(
      movieListEntity.data,
    );
  }
}
