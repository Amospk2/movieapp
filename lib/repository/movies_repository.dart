import '../models/movie_model.dart';

abstract class MoviesRepository {
  Future<MovieModel> getMovies();
}
