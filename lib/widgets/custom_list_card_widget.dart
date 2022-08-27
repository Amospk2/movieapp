import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/view_page.dart';

import '../utils/api.utils.dart';

class CustomListCard extends StatelessWidget {
  final Movie movie;
  final MovieController controllerM;
  const CustomListCard(
      {Key? key, required this.movie, required this.controllerM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ViewPage(
                      movie: movie,
                      movies: controllerM.movies.value!.listMovies,
                    ), fullscreenDialog: true));
      },
      child: Container(
        height: 180,
        decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: Hero(
                tag: movie.id!,
                child: CachedNetworkImage(
                    imageUrl: API.REQUEST_IMG(movie.poster_path!),
                    placeholder: (_, downloadProgress)=> const CircularProgressIndicator(),
                  ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.headline5,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Spacer(),
                  Text("Popularidade:" + movie.popularity.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Votos:" + movie.vote_count.toString()),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
