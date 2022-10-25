


import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';
import '../repositories/get_movie_repository.dart';
import 'get_movies_usecase.dart';

class GetMoviesUseCaseImp implements GetMoviesUseCase {
  final GetMoviesRepository _getMoviesRepository;
  GetMoviesUseCaseImp(this._getMoviesRepository);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesRepository();
  }
}