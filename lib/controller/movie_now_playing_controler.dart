import 'package:flutter/material.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_usecase.dart';
import 'package:ilia_movies/models/movie_entity.dart';

class MovieNowPlayingControler extends ChangeNotifier {
  final MovieUsecase movieUsecase;

  final movieListenable = ValueNotifier<List<MovieEntity>>([]);
  List<MovieEntity> _items = [];

  MovieNowPlayingControler(this.movieUsecase);

  Future<void> call() async {
    try {
      final useCase = await movieUsecase();

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

      movieListenable.value = useCase;
      movieListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

  List<MovieEntity> get items => _items;
}
