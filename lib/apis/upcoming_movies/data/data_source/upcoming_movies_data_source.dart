import 'package:ilia_movies/apis/upcoming_movies/data/models/data_upcoming_movies_list_model.dart';
import 'package:ilia_movies/core/Constants/constants.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/share/base/datasource/datasource.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';

class UpcomingMoviesDataSource implements DataSource {
  final HttpFacade httpFacade;

  UpcomingMoviesDataSource(this.httpFacade);

  @override
  Future<dynamic> call(
      {FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    const method = HttpMethod.get;

    String endPoint =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=pt-BR&page=1';
    final response = await httpFacade(method, endPoint, data: data);

    var dataMovieList = DataUpcomingMoviesListModel.fromJson({"data": response});

    final upcomingMovies = dataMovieList.data
        .map((data) => MovieEntity(
            data.adult,
            data.backdrop_path,
            data.genre_ids,
            data.id,
            data.original_language,
            data.original_title,
            data.overview,
            data.popularity,
            data.poster_path,
            data.release_date,
            data.title,
            data.video,
            data.vote_average,
            data.vote_count))
        .toList();

    return upcomingMovies;
  }
}
