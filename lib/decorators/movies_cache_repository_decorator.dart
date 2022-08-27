import 'dart:convert';


import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'movie_repository_decorator.dart';

class MovieCacheRepositoryDecoretor extends MoviesRepositoryDecoretor{
  MovieCacheRepositoryDecoretor(MoviesRepository moviesRepository) : super(moviesRepository);

  @override
  Future<MovieModel> getMovies() async {
    try{
      MovieModel movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
    
  }


  _saveInCache(MovieModel movies) async
  {
    var prefs = await SharedPreferences.getInstance();
    String moviesJson = jsonEncode(movies.toJson());
    prefs.setString('movie_cache', moviesJson);
  }


  Future<MovieModel> _getInCache() async{
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movie_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = MovieModel.fromJson(json); 
    return movies;
    
  }

}