import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_state.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PopularMovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w200${movie.backdrop_path}',
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          } else if (state is PopularMovieError) {
            return Center(child: Text(state.message));
          } else {
            return Center(
                child: Text(
                    'Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
          }
        },
      ),
    );
  }
}
