import 'package:ilia_movies/dependency_injection/details_movie_injector.dart';
import 'package:ilia_movies/dependency_injection/has_connectivity_injector.dart';
import 'package:ilia_movies/dependency_injection/http_connection_injector.dart';
import 'package:ilia_movies/dependency_injection/movie_now_playing_injector.dart';
import 'package:ilia_movies/dependency_injection/popular_movies_injector.dart';
import 'package:ilia_movies/dependency_injection/top_rated_movies_injector.dart';
import 'package:ilia_movies/dependency_injection/upcoming_movies_injector.dart';

class Injector {
  call() {
    MovieNowPlayingInjector()();
    PopularMoviesInjector()();
    TopRatedMoviesInjector()();
    UpcomingMoviesInjector()();
    DetailsMovieInjector()();
    HasConnectivityInjector()();
    HttpConnectionInjector()();
  }
}
