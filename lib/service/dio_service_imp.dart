import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp extends DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
    'content-type': 'application/json;charset=utf-8',
    'authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODExNTM0YTc0ODkwMDEwN2FiNDNlMmYzYmE2NmU1YSIsInN1YiI6IjYyZjUwMGRmNTk0Yzk0MDA3YWE2OGMyOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KWDGPX6fiUuYCQmFTBnLWhweDPxgdltmvCDSpXYfxew'
    }));
  }
}
