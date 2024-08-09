import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/apis/top_rated_movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final TopRatedMoviesUsecase movieUsecase;

  TopRatedMoviesBloc({required this.movieUsecase}) : super(TopRatedMovieInitial()) {
    on<FetchTopRatedMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchTopRatedMovies event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMovieLoading());
    try {
      final movies = await movieUsecase();
      emit(TopRatedMovieLoaded(movies: movies));
    } catch (e) {
      emit(TopRatedMovieError(message: e.toString()));
    }
  }
}

