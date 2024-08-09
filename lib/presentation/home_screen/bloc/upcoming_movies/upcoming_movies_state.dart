import 'package:equatable/equatable.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class UpcomingMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpcomingMovieInitial extends UpcomingMoviesState {}

class UpcomingMovieLoading extends UpcomingMoviesState {}

class UpcomingMovieLoaded extends UpcomingMoviesState {
  final List<MovieEntity> movies;

  UpcomingMovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class UpcomingMovieError extends UpcomingMoviesState {
  final String message;

  UpcomingMovieError({required this.message});

  @override
  List<Object> get props => [message];
}