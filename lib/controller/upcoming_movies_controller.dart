import 'package:flutter/material.dart';
import 'package:ilia_movies/apis/upcoming_movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:ilia_movies/models/movie_entity.dart';

class UpcomingMoviesControler extends ChangeNotifier {
  final UpcomingMoviesUsecase upcomingMoviesUsecase;

  final upcomingMoviesListenable = ValueNotifier<List<MovieEntity>>([]);
  List<MovieEntity> _items = [];

  UpcomingMoviesControler(this.upcomingMoviesUsecase);

  Future<void> call() async {
    try {
      final useCase = await upcomingMoviesUsecase();

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

      upcomingMoviesListenable.value = useCase;
      upcomingMoviesListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

  List<MovieEntity> get items => _items;
}
