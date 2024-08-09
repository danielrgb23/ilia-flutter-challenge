import 'package:flutter/material.dart';
import 'package:ilia_movies/apis/top_rated_movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:ilia_movies/models/movie_entity.dart';

class TopRatedMoviesControler extends ChangeNotifier {
  final TopRatedMoviesUsecase topRatedMoviesUsecase;

  final popularMoviesListenable = ValueNotifier<List<MovieEntity>>([]);
  List<MovieEntity> _items = [];

  TopRatedMoviesControler(this.topRatedMoviesUsecase);

  Future<void> call() async {
    try {
      final useCase = await topRatedMoviesUsecase();

      _items = useCase
          .map((data) => MovieEntity(
              data.adult,
              data.backdrop_path,
              data.genre_ids,
              data.id,
              data.original_language,
              data.original_title,
              data.overview,
              data.popularity,
              data.poster_path,
              data.release_date,
              data.title,
              data.video,
              data.vote_average,
              data.vote_count))
          .toList();

      popularMoviesListenable.value = useCase;
      popularMoviesListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

  List<MovieEntity> get items => _items;
}
