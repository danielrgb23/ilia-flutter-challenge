import 'package:flutter/material.dart';
import 'package:ilia_movies/app/app.dart';
import 'package:ilia_movies/app/controller.dart';

void main() async {
  Controller controller = Controller();
  await controller();

  runApp(MyApp(controller: controller));
}
