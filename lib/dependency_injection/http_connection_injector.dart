import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/share/boundaries/http_connection/domain/domain.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade_impl.dart';

class HttpConnectionInjector {
  call() {
    GetIt.I.registerFactory<Dio>(() => Dio());

    GetIt.I.registerFactory<Domain>(() => Domain());

    GetIt.I.registerFactory<HttpFacade>(
      () => HttpFacadeImpl(
        GetIt.I<Dio>(),
        // GetIt.I<HasConnectivityFacade>(),
        // GetIt.I<Domain>(),
      ),
    );
  }
}