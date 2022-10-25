import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../controllers/movie_controller.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ValueListenableBuilder<MovieEntity?>(
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
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          TextField(
                            onChanged: _controller.onChanged,
                            decoration:
                                const InputDecoration(icon: Icon(Icons.search)),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1),
                            child: Lottie.asset('assets/lottie.json')),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder<MovieEntity?>(
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
