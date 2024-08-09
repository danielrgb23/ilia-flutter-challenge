import 'package:ilia_movies/models/belong_to_collection_entity.dart';
import 'package:ilia_movies/models/videos_model.dart';

class DetailsMovieEntity {
  final String title;
  final int id;
  final String backdropPath;
  final List<dynamic> genres;
  final String posterPath;
  final String releaseDate;
  final int runTime;
  final double voteAverage;
  final int voteCount;
  final dynamic videos;
  final String overView;

  DetailsMovieEntity(
      this.title,
      this.id,
      this.backdropPath,
      this.genres,
      this.posterPath,
      this.releaseDate,
      this.runTime,
      this.voteAverage,
      this.voteCount,
      this.videos,
      this.overView
      );
}