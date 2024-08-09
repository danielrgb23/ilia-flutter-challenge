import 'package:ilia_movies/share/base/exception/base_exception.dart';

class InvalidHttpMethodException extends BaseException {
  InvalidHttpMethodException(String cause) : super(cause: cause);

  @override
  String toString() => "Invalid (enum) Http Method Exception: $cause";
}