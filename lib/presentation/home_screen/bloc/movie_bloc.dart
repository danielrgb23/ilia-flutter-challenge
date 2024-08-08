import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieUsecase movieUsecase;

  MovieBloc({required this.movieUsecase}) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await movieUsecase();
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}

