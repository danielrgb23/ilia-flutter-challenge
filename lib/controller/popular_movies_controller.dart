import 'package:flutter/material.dart';
import 'package:ilia_movies/apis/popular_movies/domain/usecases/popular_movies_usecase.dart';
import 'package:ilia_movies/models/movie_entity.dart';

class PopularMoviesControler extends ChangeNotifier {
  final PopularMoviesUsecase popularMoviesUsecase;

  final popularMoviesListenable = ValueNotifier<List<MovieEntity>>([]);
  List<MovieEntity> _items = [];

  PopularMoviesControler(this.popularMoviesUsecase);

  Future<void> call() async {
    try {
      final useCase = await popularMoviesUsecase();

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
