import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/upcoming_movies/upcoming_movies_state.dart';
import 'package:ilia_movies/widgets/text_wrapper_widget.dart';

class PosterMovie extends StatelessWidget {
  const PosterMovie(
      {Key? key,
      required this.images,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final String images;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Card(
        elevation: 5,
        child: Stack(
          children: [
            Image.network(
              images,
              fit: BoxFit.cover,
              width: 150,
              height: 220,
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.all(8),
                child: TextWrapper(title: title)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
