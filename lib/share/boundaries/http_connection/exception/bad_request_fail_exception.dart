import 'package:ilia_movies/share/base/exception/base_exception.dart';

class BadRequestFailException extends BaseException {
  late String message;
  late int statusCode;
  BadRequestFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
    statusCode = cause['statusCode'] ?? '';
  }
}
