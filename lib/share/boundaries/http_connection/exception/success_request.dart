import 'package:ilia_movies/share/base/exception/base_exception.dart';

class SuccessRequest extends BaseException {
  late String message;
  SuccessRequest(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }
}