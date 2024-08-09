import 'package:equatable/equatable.dart';

abstract class UpcomingMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUpcomingMovies extends UpcomingMoviesEvent {}