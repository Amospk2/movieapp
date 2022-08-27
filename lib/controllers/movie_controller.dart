import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie_model.dart';

import '../repository/movies_repository.dart';

class MovieController {
  final MoviesRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<MovieModel?> movies = ValueNotifier<MovieModel?>(null);
  ValueNotifier<bool?> ErrorFound = ValueNotifier<bool?>(false);
  MovieModel? _chaceMovie;

  fetch() async {
    try {
      movies.value = await _movieRepository.getMovies();
      _chaceMovie = movies.value;
    } catch (e) {
      ErrorFound.value = true;
    }
  }

  OnChanged(String value) {
    List<Movie> _list = _chaceMovie!.listMovies
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase())).toList();

    movies.value = movies.value!.copyWith(listMovies: _list);
  }

}
