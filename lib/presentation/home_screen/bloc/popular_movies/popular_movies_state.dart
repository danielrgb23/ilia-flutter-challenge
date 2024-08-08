import 'package:equatable/equatable.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class PopularMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMovieInitial extends PopularMoviesState {}

class PopularMovieLoading extends PopularMoviesState {}

class PopularMovieLoaded extends PopularMoviesState {
  final List<MovieEntity> movies;

  PopularMovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class PopularMovieError extends PopularMoviesState {
  final String message;

  PopularMovieError({required this.message});

  @override
  List<Object> get props => [message];
}