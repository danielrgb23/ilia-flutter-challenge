import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/now_playing_movies/data/data_source/movie_data_source.dart';
import 'package:ilia_movies/apis/now_playing_movies/data/repository/movie_now_playing_repository_impl.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/repository/movie_now_playing_repository.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_usecase.dart';
import 'package:ilia_movies/controller/movie_now_playing_controler.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class MovieNowPlayingInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<MovieNowPlayingControler>(
        () => MovieNowPlayingControler(
              getIT<MovieNowPlayingUsecase>(),
            ));
    
    // Register factories
    getIT.registerFactory<MovieNowPlayingUsecase>(() => MovieUsecaseImpl(
          getIT<MovieNowPlayingRepository>(),
        ));
    getIT.registerFactory<MovieNowPlayingRepository>(() => MovieRepositoryImpl(
          getIT<MovieNowPlayingDataSource>(),
        ));
    getIT.registerFactory<MovieNowPlayingDataSource>(() => MovieNowPlayingDataSource(
          getIT<HttpFacade>(),
        ));

    getIT.registerFactory<MovieNowPlayingBloc>(() => MovieNowPlayingBloc(
          movieUsecase: getIT<MovieNowPlayingUsecase>(),
        ));
  }
}
