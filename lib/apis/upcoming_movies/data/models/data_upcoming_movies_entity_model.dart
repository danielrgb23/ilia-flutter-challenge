import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/model/model.dart';

class DataUpcomingMoviesEntityModel extends MovieEntity implements Model {
  DataUpcomingMoviesEntityModel(
    final bool adult,
    final String backdrop_path,
    final List<dynamic> genre_ids,
    final int id,
    final String original_language,
    final String original_title,
    final String overview,
    final double popularity,
    final String poster_path,
    final String release_date,
    final String title,
    final bool video,
    final double vote_average,
    final int vote_count,
  ) : super(
            adult,
            backdrop_path,
            genre_ids,
            id,
            original_language,
            original_title,
            overview,
            popularity,
            poster_path,
            release_date,
            title,
            video,
            vote_average,
            vote_count);

  @override
  Map<String, dynamic> toMap() {
    return {
      "adult": adult,
      "backdrop_path": backdrop_path,
      "genre_ids": genre_ids,
      "id": id,
      "original_language": original_language,
      "original_title": original_title,
      "overview": overview,
      "popularity": popularity,
      "poster_path": poster_path,
      "release_date": release_date,
      "title": title,
      "video": video,
      "vote_average": vote_average,
      "vote_count": vote_count
    };
  }

  @override
  factory DataUpcomingMoviesEntityModel.fromJson(Map<String, dynamic> json) {
    return DataUpcomingMoviesEntityModel(
      json["adult"] ?? false,
      json["backdrop_path"] ?? '',
      json["genre_ids"] ?? [],
      json["id"] ?? 0,
      json["original_language"] ?? '',
      json["original_title"] ?? '',
      json["overview"] ?? 0,
      json["popularity"] ?? 0,
      json["poster_path"] ?? '',
      json["release_date"] ?? '',
      json["title"] ?? '',
      json["video"] ?? false,
      json["vote_average"] ?? 0,
      json["vote_count"] ?? 0,
    );
  }

  factory DataUpcomingMoviesEntityModel.copy(MovieEntity movieEntity) {
    return DataUpcomingMoviesEntityModel(
        movieEntity.adult,
        movieEntity.backdrop_path,
        movieEntity.genre_ids,
        movieEntity.id,
        movieEntity.original_language,
        movieEntity.original_title,
        movieEntity.overview,
        movieEntity.popularity,
        movieEntity.poster_path,
        movieEntity.release_date,
        movieEntity.title,
        movieEntity.video,
        movieEntity.vote_average,
        movieEntity.vote_count);
  }
}
