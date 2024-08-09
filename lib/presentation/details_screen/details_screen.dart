import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ilia_movies/controller/details_movie_controller.dart';
import 'package:ilia_movies/widgets/movie_trailer_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.movieId, required this.movieName})
      : super(key: key);

  final String movieId;
  final String movieName;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final detailsMovieController = GetIt.I<DetailsMovieController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 29, 56, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 29, 56, 1),
        leading: IconButton(
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left_sharp),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.movieName,
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 78.0,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
            color: Color.fromRGBO(36, 37, 61, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 9),
                blurRadius: 8.0,
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: detailsMovieController.call(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var trailer =
                detailsMovieController.items.videos['results'].firstWhere(
              (video) => video['type'] == 'Trailer',
              orElse: () => null,
            );
            final movies = detailsMovieController.items;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 28.0, left: 18, right: 18),
                  child: MovieTrailerPlayer(videoId: trailer['key']),

                  // Container(
                  //   height: 200,
                  //   width: double.infinity,
                  //   color: Colors.red,
                  // ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Ano de lançamento: ${movies.releaseDate}',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'Duração: ${movies.runTime} minutos',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        movies.overView,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            letterSpacing: -.5,
                            wordSpacing: -1),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Gênero: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${movies.genres[0]['name']}, ',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${movies.genres[1]['name']}, ',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${movies.genres[2]['name']}',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Nota: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                movies.voteAverage.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          Text(
                            'Avaliações: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            movies.voteCount.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
