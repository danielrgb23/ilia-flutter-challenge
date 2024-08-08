import 'package:ilia_movies/app/app_unknow_view.dart';
import 'package:ilia_movies/app/controller.dart';
import 'package:flutter/material.dart';
import '/index.dart';

Widget initialPage(RouteSettings routeSettings, Controller controller) {
  Widget initialPage = HomeScreen();

  return initialPage;
}

Route<dynamic> routes(RouteSettings routeSettings, Controller controller) {
  Widget page = getPage(routeSettings, controller);
  switch (routeSettings.name) {
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return page;
          });
  }
}

Widget getPage(RouteSettings routeSettings, Controller controller) {
  switch (routeSettings.name) {
    case '/':
      return initialPage(routeSettings, controller);
    case HomeScreen.routeName:
      return const HomeScreen();

    default:
      return const AppUnknowView();
  }
}