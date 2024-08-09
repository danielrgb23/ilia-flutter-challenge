import 'package:flutter/material.dart';
import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/apis/details_movies/domain/usecase/details_movie_usecase.dart';
import 'package:ilia_movies/models/belong_to_collection_entity.dart';

class DetailsMovieController extends ChangeNotifier {
  final DetailsMovieUsecase detailsMovieUsecase;

  DetailsMovieEntity _items =
      DetailsMovieEntity('', 0, '', [], '', '', 0, 0, 0, {}, '');

  final detailsMovieListenable = ValueNotifier<DetailsMovieEntity>(
      DetailsMovieEntity('', 0, '', [], '', '', 0, 0, 0, {}, ''));

  DetailsMovieController(this.detailsMovieUsecase);

  Future<void> call(String movieId) async {
    try {
      final useCase = await detailsMovieUsecase(movieId);

      _items = DetailsMovieEntity(
          useCase.title,
          useCase.id,
          useCase.backdropPath,
          useCase.genres,
          useCase.posterPath,
          useCase.releaseDate,
          useCase.runTime,
          useCase.voteAverage,
          useCase.voteCount,
          useCase.videos,
          useCase.overView);

      detailsMovieListenable.value = useCase;
      detailsMovieListenable.notifyListeners();
    } catch (error) {
      Exception("Error");
    }
  }

  DetailsMovieEntity get items => _items;
}
