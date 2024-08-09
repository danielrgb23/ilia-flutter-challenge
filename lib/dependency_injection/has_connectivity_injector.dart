import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/share/boundaries/connectivity/has_conenectivity_facade.dart';
import 'package:ilia_movies/share/boundaries/connectivity/has_connectivity_facade_impl.dart';

class HasConnectivityInjector {
  call() {
    GetIt.I.registerFactory<Connectivity>(() => Connectivity());

    GetIt.I.registerFactory<HasConnectivityFacade>(
        () => HasConnectivityFacadeImpl(GetIt.I<Connectivity>()));
  }
}