import 'package:flutter/material.dart';
import 'package:ilia_movies/dependency_injection/injector.dart';
import 'package:ilia_movies/presentation/home_screen/home_screen.dart';

void main() async {
  final injector = Injector();
  injector.call();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ília Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          HomeScreen(), // Uma tela inicial onde você pode navegar para as outras
    );
  }
}
