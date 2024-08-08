import 'package:equatable/equatable.dart';

abstract class PopularMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPopularMovies extends PopularMoviesEvent {}