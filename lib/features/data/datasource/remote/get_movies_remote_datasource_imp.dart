import 'package:dartz/dartz.dart';
import '../../../../core/data/service/http_service.dart';
import '../../../../core/utils/api.utils.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../dto/movie_dto.dart';
import '../get_movies_datasource.dart';

class GetMoviesRemoteDatasourceImp implements GetMoviesDataSource {
  final HttpService _httpService;
  GetMoviesRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      var result = await _httpService.get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}