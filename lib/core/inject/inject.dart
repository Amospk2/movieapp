import 'package:get_it/get_it.dart';
import '../../features/movie/data/datasource/get_movies_datasource.dart';
import '../../features/movie/data/datasource/local/get_movie_local_datasource_decoretor.dart';
import '../../features/movie/data/datasource/remote/get_movies_remote_datasource_imp.dart';
import '../../features/movie/data/repositories/get_movies_repository_imp.dart';
import '../../features/movie/domain/repositories/get_movie_repository.dart';
import '../../features/movie/domain/usecase/get_movie_usecase_imp.dart';
import '../../features/movie/domain/usecase/get_movies_usecase.dart';
import '../../features/movie/presentation/controllers/movie_controller.dart';
import '../data/service/http_service.dart';
import '../domain/service/dio_http_service_imp.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    // datasources
    getIt.registerLazySingleton<GetMoviesDataSource>(
      () => GetMoviesLocalDataSourceDecoratorImp(
        GetMoviesRemoteDatasourceImp(getIt()),
      ),
    );
    // repositories
    getIt.registerLazySingleton<GetMoviesRepository>(
      () => GetMoviesRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<MovieController>(
      () => MovieController(getIt()),
    );
  }
}