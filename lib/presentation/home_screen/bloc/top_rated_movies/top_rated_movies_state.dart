import 'package:equatable/equatable.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class TopRatedMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopRatedMovieInitial extends TopRatedMoviesState {}

class TopRatedMovieLoading extends TopRatedMoviesState {}

class TopRatedMovieLoaded extends TopRatedMoviesState {
  final List<MovieEntity> movies;

  TopRatedMovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class TopRatedMovieError extends TopRatedMoviesState {
  final String message;

  TopRatedMovieError({required this.message});

  @override
  List<Object> get props => [message];
}