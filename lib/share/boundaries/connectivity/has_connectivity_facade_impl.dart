import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ilia_movies/share/boundaries/connectivity/exception/unavailable_network_exception.dart';

import 'package:ilia_movies/share/boundaries/connectivity/has_conenectivity_facade.dart';

class HasConnectivityFacadeImpl implements HasConnectivityFacade {
  final Connectivity connectivity;

  HasConnectivityFacadeImpl(this.connectivity);

  @override
  Future<bool> call() async {
    var result = await (connectivity.checkConnectivity());
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return true;
      default:
        throw UnavailableNetworkException('');
    }
  }
}
