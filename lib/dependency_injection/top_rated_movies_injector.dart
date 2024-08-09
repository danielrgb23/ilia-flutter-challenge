import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/top_rated_movies/data/data_source/top_rated_movies_data_source.dart';
import 'package:ilia_movies/apis/top_rated_movies/data/repository/top_rated_movies_repository_impl.dart';
import 'package:ilia_movies/apis/top_rated_movies/domain/repository/top_rated_movies_repository.dart';
import 'package:ilia_movies/apis/top_rated_movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:ilia_movies/controller/top_rated_movies_controller.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class TopRatedMoviesInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<TopRatedMoviesControler>(
        () => TopRatedMoviesControler(
              getIT<TopRatedMoviesUsecase>(),
            ));
    getIT.registerFactory<TopRatedMoviesUsecase>(() => TopRatedMoviesUsecaseImpl(
          getIT<TopRatedMoviesRepository>(),
        ));
    getIT.registerFactory<TopRatedMoviesRepository>(() => TopRatedMovieRepositoryImpl(
          getIT<TopRatedMoviesDataSource>(),
        ));
    getIT.registerFactory<TopRatedMoviesDataSource>(() => TopRatedMoviesDataSource(
          getIT<HttpFacade>(),
        ));

    getIT.registerFactory<TopRatedMoviesBloc>(() => TopRatedMoviesBloc(
          movieUsecase: getIT<TopRatedMoviesUsecase>(),
        ));
  }
}