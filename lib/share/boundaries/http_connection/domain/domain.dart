import 'package:ilia_movies/core/Constants/constants.dart';

class Domain {


  String call(String endPoint) {
     return 'https://api.themoviedb.org/3/movie/$endPoint?$apiKey&language=en-US&page=1';

  }
}