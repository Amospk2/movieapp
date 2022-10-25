import 'package:dartz/dartz.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/get_movie_repository.dart';
import '../datasource/get_movies_datasource.dart';


class GetMoviesRepositoryImp implements GetMoviesRepository {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesRepositoryImp(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesDataSource();
  }
}