import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movies_repository.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/api.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<MovieModel> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return MovieModel.fromJson(result.data);
  }
}
