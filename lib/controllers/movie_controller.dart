import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie_model.dart';

import '../repository/movies_repository.dart';

class MovieController {
  final MoviesRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<MovieModel?> movies = ValueNotifier<MovieModel?>(null);

  fetch() async {
    movies.value = await _movieRepository.getMovies();
  }
}
