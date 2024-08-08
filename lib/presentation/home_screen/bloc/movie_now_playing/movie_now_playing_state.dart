import 'package:equatable/equatable.dart';
import 'package:ilia_movies/models/movie_entity.dart';

abstract class MovieNowPlayingState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieNowPlayingState {}

class MovieLoading extends MovieNowPlayingState {}

class MovieLoaded extends MovieNowPlayingState {
  final List<MovieEntity> movies;

  MovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieNowPlayingState {
  final String message;

  MovieError({required this.message});

  @override
  List<Object> get props => [message];
}