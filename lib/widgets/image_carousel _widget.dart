import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/presentation/details_screen/details_screen.dart';

class ImageCarousel extends StatefulWidget {
  final List<MovieEntity> movies; 

  ImageCarousel({required this.movies,});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.movies.length,
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final movie = widget.movies[index];
            final imageUrl =
                'https://image.tmdb.org/t/p/w1280${movie.backdrop_path}';
    
            return Stack(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen(movieId: movie.id.toString(),movieName: movie.title,);
                      }));
                  },
                  focusColor: Colors.white,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(71, 71, 71, 0.68),
                    ),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.movies.map((movie) {
              int index = widget.movies.indexOf(movie);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12),
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromRGBO(97, 48, 150, 1)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
