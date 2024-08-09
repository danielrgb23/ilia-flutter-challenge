import 'package:get_it/get_it.dart';
import 'package:ilia_movies/apis/upcoming_movies/data/data_source/upcoming_movies_data_source.dart';
import 'package:ilia_movies/apis/upcoming_movies/data/repository/upcoming_movies_repository_impl.dart';
import 'package:ilia_movies/apis/upcoming_movies/domain/repository/upcoming_movies_repository.dart';
import 'package:ilia_movies/apis/upcoming_movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:ilia_movies/controller/upcoming_movies_controller.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class UpcomingMoviesInjector {
  final getIT = GetIt.I;

  void call() {
    getIT.registerLazySingleton<UpcomingMoviesControler>(
        () => UpcomingMoviesControler(
              getIT<UpcomingMoviesUsecase>(),
            ));
    getIT
        .registerFactory<UpcomingMoviesUsecase>(() => UpcomingMoviesUsecaseImpl(
              getIT<UpcomingMoviesRepository>(),
            ));
    getIT.registerFactory<UpcomingMoviesRepository>(
        () => UpcomingMovieRepositoryImpl(
              getIT<UpcomingMoviesDataSource>(),
            ));
    getIT.registerFactory<UpcomingMoviesDataSource>(
        () => UpcomingMoviesDataSource(
              getIT<HttpFacade>(),
            ));

    getIT.registerFactory<UpcomingMoviesBloc>(() => UpcomingMoviesBloc(
          movieUsecase: getIT<UpcomingMoviesUsecase>(),
        ));
  }
}
