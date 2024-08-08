import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/controller/movie_now_playing_controler.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getIt = GetIt.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieBloc>()..add(FetchMovies()),
      child: Scaffold(
        appBar: AppBar(title: Text('Movies')),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
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
            } else if (state is MovieError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
            }
          },
        ),
      ),
    );
  }
}
