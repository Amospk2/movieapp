import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repository/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:movie_app/utils/api.utils.dart';

import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  final ScrollController _controllerS = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie App"), centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 200,
                child: Scrollbar(
                  isAlwaysShown: true,
                controller: _controllerS,
                    child:ValueListenableBuilder<MovieModel?>(
                      valueListenable: _controller.movies,
                      builder: (_, movies, __) {
                        
                        return movies != null
                            ? ListView.separated(
                              controller: _controllerS,
                              scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: movies.listMovies.length,
                                itemBuilder: (__, idx) => InkWell(onTap: () => Navigator.of(context).pushNamed('/View', arguments: {'movie': movies.listMovies[idx], 'controller':_controller}),
                                child: Image.network(API.REQUEST_IMG(movies.listMovies[idx].poster_path)),),
                                separatorBuilder: (_, __) => SizedBox(width: 10,),
                              )
                            : const Center(child: CircularProgressIndicator());
                      },
                    ),
                ),
              ),
              SizedBox(height: 10,),
              ValueListenableBuilder<MovieModel?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.listMovies.length,
                          itemBuilder: (__, idx) => CustomListCard(movie:movies.listMovies[idx], controllerM: _controller),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
