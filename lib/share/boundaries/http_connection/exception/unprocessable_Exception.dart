import 'package:ilia_movies/share/base/exception/base_exception.dart';

class UnprocessableException extends BaseException {
  late String error;
  late String message;

  UnprocessableException(Map cause) : super(cause: cause.toString()) {
    error = cause['error'] ?? '';
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Unprocessable Exception: $cause";
}