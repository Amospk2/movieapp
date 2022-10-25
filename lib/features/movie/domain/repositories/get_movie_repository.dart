import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MovieEntity>> call();
}