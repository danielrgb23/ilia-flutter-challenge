import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/apis/upcoming_movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final UpcomingMoviesUsecase movieUsecase;

  UpcomingMoviesBloc({required this.movieUsecase}) : super(UpcomingMovieInitial()) {
    on<FetchUpcomingMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchUpcomingMovies event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMovieLoading());
    try {
      final movies = await movieUsecase();
      emit(UpcomingMovieLoaded(movies: movies));
    } catch (e) {
      emit(UpcomingMovieError(message: e.toString()));
    }
  }
}

