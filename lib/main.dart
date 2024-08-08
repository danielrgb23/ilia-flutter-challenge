import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/dependency_injection/injector.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_event.dart';
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
          create: (context) => getIt<MovieNowPlayingBloc>()..add(FetchMoviesNowPlaying()),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        ),
        // Adicione mais BlocProviders conforme necessário
      ],
      child: MaterialApp(
      title: 'Ília Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          HomeScreen(), // Uma tela inicial onde você pode navegar para as outras
    ),
    );
  }
}
