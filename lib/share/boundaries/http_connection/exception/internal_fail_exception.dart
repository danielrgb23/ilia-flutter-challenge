import 'package:ilia_movies/share/base/exception/base_exception.dart';

class InternalFailException extends BaseException {
  late String message;
  InternalFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Internal Fail Exception: $cause";
}