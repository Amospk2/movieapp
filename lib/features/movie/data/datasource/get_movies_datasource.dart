import 'package:dartz/dartz.dart';
import '../../domain/entities/movie_entity.dart';

abstract class GetMoviesDataSource {
  Future<Either<Exception, MovieEntity>> call();
}