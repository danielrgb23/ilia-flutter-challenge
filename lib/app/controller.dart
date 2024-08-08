import 'package:ilia_movies/dependency_injection/injector.dart';
import 'package:flutter/foundation.dart';

class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {
   Injector()();
  }

  call() async {
    loadDependencyInjection();
  }
}
