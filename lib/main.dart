import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/dependency_injection/injector.dart';
import 'package:ilia_movies/presentation/details_screen/details_screen.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/home_screen.dart';

void main() async {
  final injector = Injector();
  injector.call();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieNowPlayingBloc>(
          create: (context) =>
              getIt<MovieNowPlayingBloc>()..add(FetchMoviesNowPlaying()),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) =>
              getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        ),
        BlocProvider<TopRatedMoviesBloc>(
          create: (context) =>
              getIt<TopRatedMoviesBloc>()..add(FetchTopRatedMovies()),
        ),
        BlocProvider<UpcomingMoviesBloc>(
          create: (context) =>
              getIt<UpcomingMoviesBloc>()..add(FetchUpcomingMovies()),
        ),
      ],
      child: MaterialApp(
          title: 'Ília Movies',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}
