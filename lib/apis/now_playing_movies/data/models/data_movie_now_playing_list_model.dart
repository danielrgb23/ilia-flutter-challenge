import 'package:ilia_movies/apis/now_playing_movies/data/models/data_movie_now_playing_entity_model.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/entities/movie_now_playing_list_entity.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataMovieNowPlayingListModel extends MovieListEntity implements Model {
  DataMovieNowPlayingListModel(
    final List<MovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataMovieNowPlayingEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataMovieNowPlayingListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"]["results"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataMovieNowPlayingListModel(
      dataList.map((dataJson) => DataMovieNowPlayingEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataMovieNowPlayingListModel.copy(MovieListEntity movieListEntity) {
    return DataMovieNowPlayingListModel(
      movieListEntity.data,
    );
  }
}
