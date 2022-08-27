import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movies_repository.dart';

class MoviesRepositoryDecoretor implements MoviesRepository{

  final MoviesRepository _moviesRepository; 

  MoviesRepositoryDecoretor(this._moviesRepository);

  @override
  Future<MovieModel> getMovies() async{
    return await _moviesRepository.getMovies();
  }

}