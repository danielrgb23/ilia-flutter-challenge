import 'package:flutter/material.dart';
import 'package:ilia_movies/app/controller.dart';
import 'package:ilia_movies/app/routes/routes.dart';
import 'package:ilia_movies/presentation/home_screen/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.controller,
  });

  final Controller controller;

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ília Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => routes(settings, widget.controller),
      home: HomeScreen(),
    );
  }
}
