import 'package:ilia_movies/dependency_injection/has_connectivity_injector.dart';
import 'package:ilia_movies/dependency_injection/http_connection_injector.dart';
import 'package:ilia_movies/dependency_injection/movie_now_playing_injector.dart';
import 'package:ilia_movies/dependency_injection/popular_movies_injector.dart';

class Injector {
  call() {
    MovieNowPlayingInjector()();
    PopularMoviesInjector()();
    HasConnectivityInjector()();
    HttpConnectionInjector()();
  }
}
