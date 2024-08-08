import 'package:ilia_movies/share/base/exception/base_exception.dart';

class UnavailableNetworkException extends BaseException {
  UnavailableNetworkException(String cause) : super(cause: cause);

  @override
  String toString() => "Unavailable Network Exception";
}