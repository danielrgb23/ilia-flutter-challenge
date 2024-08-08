import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ilia_movies/apis/now_playing_movies/domain/usecases/movie_usecase.dart';
import 'package:ilia_movies/models/movie_entity.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_event.dart';
import 'package:ilia_movies/presentation/home_screen/bloc/movie_now_playing/movie_now_playing_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'movie_usecase_test.mocks.dart';

@GenerateMocks([MovieNowPlayingUsecase])
void main() {
  late MovieNowPlayingBloc movieBloc;
  late MockMovieUsecase mockMovieUsecase;

  setUp(() {
    mockMovieUsecase = MockMovieUsecase();
    movieBloc = MovieNowPlayingBloc(movieUsecase: mockMovieUsecase);
  });

  tearDown(() {
    movieBloc.close();
  });

  group('FetchMovies', () {
    final List<MovieEntity> movies = [
      MovieEntity(
          false,
          "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
          [28, 35, 878],
          533535,
          "en",
          "Deadpool & Wolverine",
          "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
          14413.653,
          "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
          "2024-07-24",
          "Deadpool & Wolverine",
          false,
          7.909,
          1507)
    ];

    blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
      'emite [MovieLoading, MovieLoaded] quando FetchMovies é adicionado e a API retorna filmes',
      build: () {
        when(mockMovieUsecase()).thenAnswer((_) async => movies);
        return movieBloc;
      },
      act: (bloc) => bloc.add(FetchMovies()),
      expect: () => [MovieLoading(), MovieLoaded(movies: movies)],
    );

    blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
      'emite [MovieLoading, MovieError] quando FetchMovies é adicionado e a API lança uma exceção',
      build: () {
        when(mockMovieUsecase()).thenThrow(Exception('Erro na API'));
        return movieBloc;
      },
      act: (bloc) => bloc.add(FetchMovies()),
      expect: () =>
          [MovieLoading(), MovieError(message: 'Exception: Erro na API')],
    );
  });
}
