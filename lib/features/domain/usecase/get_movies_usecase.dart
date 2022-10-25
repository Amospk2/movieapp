import 'package:dartz/dartz.dart';
import '../entities/movie_entity.dart';

abstract class GetMoviesUseCase {
  Future<Either<Exception, MovieEntity>> call();
}