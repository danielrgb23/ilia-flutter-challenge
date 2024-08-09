import 'package:ilia_movies/apis/details_movies/data/model/data_details_movie_list_model.dart';
import 'package:ilia_movies/apis/details_movies/domain/entities/details_movie_entity.dart';
import 'package:ilia_movies/core/Constants/constants.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class DetailsMovieDataSource implements DataSource {
  final HttpFacade httpFacade;

  DetailsMovieDataSource(this.httpFacade);

  @override
  Future<dynamic> call(
      {FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    const method = HttpMethod.get;

    String endPoint =
        'https://api.themoviedb.org/3/movie/${param!['movieId']}?api_key=$apiKey&language=en-US&append_to_response=videos';
    final response = await httpFacade(method, endPoint, data: data);

    // var dataMovieList = DataDetailsMovieListModel.fromJson({"data": response});

    final detailsMovie = DetailsMovieEntity(
        response['title'],
        response['id'],
        response['backdrop_path'],
        response['genres'],
        response['poster_path'],
        response['release_date'],
        response['runtime'],
        response['vote_average'],
        response['vote_count'],
        response['videos'],
        response['overview']
        );

    return detailsMovie;
  }
}
