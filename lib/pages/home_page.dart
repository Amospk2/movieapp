import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';

import '../decorators/movies_cache_repository_decorator.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
      MovieCacheRepositoryDecoretor(MoviesRepositoryImp(DioServiceImp())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ValueListenableBuilder<bool?>(
                  valueListenable: _controller.ErrorFound,
                  builder: (_, error, __) {
                    if (error == true) {
                      return const Center(
                        child: Text(
                            "Error Found: Please Check You Internet Connection"),
                      );
                    } else {
                      return ValueListenableBuilder<MovieModel?>(
                          valueListenable: _controller.movies,
                          builder: (_, movies, __) {
                            if (movies != null) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  Text(
                                    "MovieApp",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  TextField(
                                    onChanged: _controller.OnChanged,
                                    decoration: const InputDecoration(
                                        icon: Icon(Icons.search)),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                                    child: Lottie.asset('assets/lottie.json')),);
                            }
                          });
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder<MovieModel?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.listMovies.length,
                          itemBuilder: (__, idx) => CustomListCard(
                              movie: movies.listMovies[idx],
                              controllerM: _controller),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
