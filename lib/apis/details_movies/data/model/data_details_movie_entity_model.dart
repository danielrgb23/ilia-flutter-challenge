import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/models/belong_to_collection_entity.dart';
import 'package:ilia_movies/models/videos_model.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataDetailsMovieEntityModel extends DetailsMovieEntity implements Model {
  DataDetailsMovieEntityModel(
    final String title,
    final int id,
    final String backdropPath,
    final List<dynamic> genres,
    final String posterPath,
    final String releaseDate,
    final int runTime,
    final double voteAverage,
    final int voteCount,
    final dynamic videos,
    final String overView
  ) : super(
          title,
          id,
          backdropPath,
          genres,
          posterPath,
          releaseDate,
          runTime,
          voteAverage,
          voteCount,
          videos,
          overView
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'backdrop_path': backdropPath,
      'genres': genres,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'runtime': runTime,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'videos': videos,
      'overview': overView
    };
  }

  @override
  factory DataDetailsMovieEntityModel.fromJson(Map<String, dynamic> json) {
    return DataDetailsMovieEntityModel(
      json['title'] ?? '',
      json['id'] ?? 0,
      json['backdrop_path'] ?? '',
      json['genres'] ?? [],
      json['poster_path'] ?? '',
      json['release_date'] ?? '',
      json['runtime'] ?? 0,
      json['vote_average'] ?? 0,
      json['vote_count'] ?? 0,
      json['videos'] ?? {},
      json['overview'] ?? ''
    );
  }

  factory DataDetailsMovieEntityModel.copy(
      DetailsMovieEntity detailsMovieEntity) {
    return DataDetailsMovieEntityModel(
      detailsMovieEntity.title,
      detailsMovieEntity.id,
      detailsMovieEntity.backdropPath,
      detailsMovieEntity.genres,
      detailsMovieEntity.posterPath,
      detailsMovieEntity.releaseDate,
      detailsMovieEntity.runTime,
      detailsMovieEntity.voteAverage,
      detailsMovieEntity.voteCount,
      detailsMovieEntity.videos,
      detailsMovieEntity.overView
    );
  }
}
