import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_now_playing_usecase.dart';
import 'movie_now_playing_event.dart';
import 'movie_now_playing_state.dart';

class MovieNowPlayingBloc extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final MovieNowPlayingUsecase movieUsecase;

  MovieNowPlayingBloc({required this.movieUsecase}) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieNowPlayingState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await movieUsecase();
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}

