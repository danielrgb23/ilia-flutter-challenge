import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_state.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_state.dart';

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
      body: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (context, state) {
          if (state is TopRatedMovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopRatedMovieLoaded) {
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
          } else if (state is TopRatedMovieError) {
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
