import 'package:dio/dio.dart';
import '../../data/service/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        'content-type': 'application/json;charset=utf-8',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODExNTM0YTc0ODkwMDEwN2FiNDNlMmYzYmE2NmU1YSIsInN1YiI6IjYyZjUwMGRmNTk0Yzk0MDA3YWE2OGMyOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KWDGPX6fiUuYCQmFTBnLWhweDPxgdltmvCDSpXYfxew'
      }),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}