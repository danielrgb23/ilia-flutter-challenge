import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/popular_movies/data/data_source/popular_movies_data_source.dart';
import 'package:ilia_movies/apis/popular_movies/data/repository/popular_movies_repository_impl.dart';
import 'package:ilia_movies/apis/popular_movies/domain/repository/popular_movies_repository.dart';
import 'package:ilia_movies/apis/popular_movies/domain/usecases/popular_movies_usecase.dart';
import 'package:ilia_movies/controller/popular_movies_controller.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class PopularMoviesInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<PopularMoviesControler>(
        () => PopularMoviesControler(
              getIT<PopularMoviesUsecase>(),
            ));
    getIT.registerFactory<PopularMoviesUsecase>(() => PopularMoviesUsecaseImpl(
          getIT<PopularMoviesRepository>(),
        ));
    getIT.registerFactory<PopularMoviesRepository>(() => PopularMovieRepositoryImpl(
          getIT<PopularMoviesDataSource>(),
        ));
    getIT.registerFactory<PopularMoviesDataSource>(() => PopularMoviesDataSource(
          getIT<HttpFacade>(),
        ));

    getIT.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(
          movieUsecase: getIT<PopularMoviesUsecase>(),
        ));
  }
}