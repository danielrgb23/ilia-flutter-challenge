import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/apis/popular_movies/domain/usecases/popular_movies_usecase.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final PopularMoviesUsecase movieUsecase;

  PopularMoviesBloc({required this.movieUsecase}) : super(PopularMovieInitial()) {
    on<FetchPopularMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchPopularMovies event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMovieLoading());
    try {
      final movies = await movieUsecase();
      emit(PopularMovieLoaded(movies: movies));
    } catch (e) {
      emit(PopularMovieError(message: e.toString()));
    }
  }
}

