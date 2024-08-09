import 'package:ilia_movies/apis/details_movies/data/model/data_details_movie_entity_model.dart';
import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_list_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataDetailsMovieListModel extends DetailsMovieListEntity implements Model {
  DataDetailsMovieListModel(
    final List<DetailsMovieEntity> data,
  ) : super(data);

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data.map((date) => DataDetailsMovieEntityModel.copy(date).toMap()).toList()
    };
  }

  @override
  factory DataDetailsMovieListModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as List<dynamic>;

    final dataList = data.cast<Map<String, dynamic>>();

    return DataDetailsMovieListModel(
      dataList.map((dataJson) => DataDetailsMovieEntityModel.fromJson(dataJson)).toList(),
    );
  }

  factory DataDetailsMovieListModel.copy(DetailsMovieListEntity detailsMovieListEntity) {
    return DataDetailsMovieListModel(
      detailsMovieListEntity.data,
    );
  }
}