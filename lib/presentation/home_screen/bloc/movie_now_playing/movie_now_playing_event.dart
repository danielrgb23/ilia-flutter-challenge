import 'package:equatable/equatable.dart';

abstract class MovieNowPlayingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMoviesNowPlaying extends MovieNowPlayingEvent {}