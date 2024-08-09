import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/presentation/details_screen/details_screen.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_state.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_state.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_state.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_state.dart';
import 'package:ilia_movies/widgets/image_carousel%20_widget.dart';
import 'package:ilia_movies/widgets/poster_movie.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 29, 56, 1),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(28, 29, 56, 1),
      // elevation: 10,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailsScreen();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Image.asset(
          'assets/images/ilia_movies.png',
          height: 80,
          width: 80,
          fit: BoxFit.contain,
        ),
      ),
      toolbarHeight: 78.0,
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
          color: Color.fromRGBO(36, 37, 61, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 9),
              blurRadius: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
            builder: (context, state) {
              if (state is UpcomingMovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UpcomingMovieLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: ImageCarousel(
                    movies: state.movies.sublist(0, 9),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen();
                      }));
                    },
                  ),
                );
              } else if (state is UpcomingMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: Text(
                        'Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 14),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Lançamentos",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                return Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 6),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return PosterMovie(
                                images:
                                    'https://image.tmdb.org/t/p/w1280${state.movies[index].poster_path}',
                                title: state.movies[index].title,
                                onPressed: () {});
                          }),
                    ));
              } else if (state is MovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: Text(
                        'Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 14),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Populares",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state) {
              if (state is PopularMovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PopularMovieLoaded) {
                return Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 6),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return PosterMovie(
                                images:
                                    'https://image.tmdb.org/t/p/w1280${state.movies[index].poster_path}',
                                title: state.movies[index].title,
                                onPressed: () {});
                          }),
                    ));
              } else if (state is PopularMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: Text(
                        'Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 14),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Melhor Avaliados",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
            builder: (context, state) {
              if (state is TopRatedMovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TopRatedMovieLoaded) {
                return Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 6),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return PosterMovie(
                                images:
                                    'https://image.tmdb.org/t/p/w1280${state.movies[index].poster_path}',
                                title: state.movies[index].title,
                                onPressed: () {});
                          }),
                    ));
              } else if (state is TopRatedMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: Text(
                        'Estamos enfrentando problemas agora. Tente novamente mais tarde!'));
              }
            },
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
