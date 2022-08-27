import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';

import '../models/movie_model.dart';
import '../pages/view_page.dart';
import '../utils/api.utils.dart';

class CustomListCardCarrousel extends StatelessWidget {
  final Movie movies;
  final MovieController controller;

  const CustomListCardCarrousel(
      {Key? key, required this.movies, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ViewPage(
                    movie: movies,
                    movies: controller.movies.value!.listMovies,
                  ),
              fullscreenDialog: true)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: CachedNetworkImage(
          imageUrl: API.REQUEST_IMG(movies.poster_path!),
        ),
      ),
    );
  }
}
