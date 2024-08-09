import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/details_movies/data/data_source/details_movie_data_source.dart';
import 'package:ilia_movies/apis/details_movies/data/repository/details_movie_repository_impl.dart';
import 'package:ilia_movies/apis/details_movies/domain/repository/details_movie_repository.dart';
import 'package:ilia_movies/apis/details_movies/domain/usecase/details_movie_usecase.dart';
import 'package:ilia_movies/controller/details_movie_controller.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class DetailsMovieInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<DetailsMovieController>(
        () => DetailsMovieController(
              getIT<DetailsMovieUsecase>(),
            ));
    
    // Register factories
    getIT.registerFactory<DetailsMovieUsecase>(() => DetailsMovieUsecaseImpl(
          getIT<DetailsMovieRepository>(),
        ));
    getIT.registerFactory<DetailsMovieRepository>(() => DetailsMovieRepositoryImpl(
          getIT<DetailsMovieDataSource>(),
        ));
    getIT.registerFactory<DetailsMovieDataSource>(() => DetailsMovieDataSource(
          getIT<HttpFacade>(),
        ));

    // getIT.registerFactory<MovieNowPlayingBloc>(() => MovieNowPlayingBloc(
    //       movieUsecase: getIT<MovieNowPlayingUsecase>(),
    //     ));
  }
}