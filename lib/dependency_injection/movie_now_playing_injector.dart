import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/now_playing_movies/data/data_source/movie_data_source.dart';
import 'package:ilia_movies/apis/now_playing_movies/data/repository/movie_repository_impl.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/repository/movie_repository.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_usecase.dart';
import 'package:ilia_movies/controller/movie_now_playing_controler.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_bloc.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class MovieNowPlayingInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<MovieNowPlayingControler>(
        () => MovieNowPlayingControler(
              getIT<MovieUsecase>(),
            ));
    
    // Register factories
    getIT.registerFactory<MovieUsecase>(() => MovieUsecaseImpl(
          getIT<MovieRepository>(),
        ));
    getIT.registerFactory<MovieRepository>(() => MovieRepositoryImpl(
          getIT<MovieDataSource>(),
        ));
    getIT.registerFactory<MovieDataSource>(() => MovieDataSource(
          getIT<HttpFacade>(),
        ));

    getIT.registerFactory<MovieBloc>(() => MovieBloc(
          movieUsecase: getIT<MovieUsecase>(),
        ));
  }
}
