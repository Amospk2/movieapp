import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/api.utils.dart';

class ViewPage extends StatelessWidget {
  final Movie movie;
  final List<Movie> movies;

  ViewPage({Key? key, required this.movie, required this.movies})
      : super(key: key) {
    movies.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl() async {
      final Uri _url = Uri.parse(
          'https://www.youtube.com/results?search_query=${movie.title} trailer');
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 41),
      appBar: AppBar(
        title: Text(movie.title!),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Hero(
            tag: movie.id!,
            child: Container(
              height: 470,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff404040),
              ),
              child: CachedNetworkImage(
                imageUrl: API.REQUEST_IMG(movie.poster_path!),
                placeholder: (_, downloadProgress)=> const CircularProgressIndicator(),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 470,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff11181E).withOpacity(1),
                  Color(0xff404040).withOpacity(0)
                ])),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 470,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Color(0xff11181E).withOpacity(0.5),
                            Color(0xff11181E).withOpacity(0.4),
                            Color(0xff404040).withOpacity(0.4)
                          ])),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Availlable Now"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Watch Now",
                                    style: TextStyle(fontSize: 35),
                                    textAlign: TextAlign.center,
                                  )
                                ]),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 30,
                              child: Container(
                                height: 65,
                                width: 65,
                                padding: const EdgeInsets.only(left: 3),
                                decoration: const BoxDecoration(
                                  color: Color(0xff5093C1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: _launchUrl,
                                  icon: const Icon(Icons.play_arrow,
                                      color: Colors.white, size: 40),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0.0,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  color: const Color(0xff404040),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "The Plot",
                                  style: TextStyle(fontSize: 21),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: RichText(
                                    text: TextSpan(
                                        style: const TextStyle(fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: movie.overview,
                                              style: const TextStyle(
                                                  color: Color(0xffc0c0c0),
                                                  fontFamily: 'Poppins')),
                                          const TextSpan(
                                              text: 'See more',
                                              style: TextStyle(
                                                  color: Color(0xff5093C1),
                                                  fontFamily: 'Poppins'))
                                        ]),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: 'Poppins'),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Director: ',
                                            style: TextStyle(
                                                color: Color(0xff5093C1))),
                                        TextSpan(text: ' Unknow')
                                      ]),
                                ),
                                const SizedBox(height: 20),
                                RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: 'Poppins'),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Writter: ',
                                            style: TextStyle(
                                                color: Color(0xff5093C1))),
                                        TextSpan(text: 'Unknow')
                                      ]),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Other Films",
                                  style: TextStyle(fontSize: 21),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  height: 140,
                                  child: ListView(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(left: 10),
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      buildCasTile(
                                          movies.lastIndexOf(movie) == 1
                                              ? 6
                                              : 1,
                                          context),
                                      buildCasTile(
                                          movies.lastIndexOf(movie) == 3
                                              ? 7
                                              : 3,
                                          context),
                                      buildCasTile(
                                          movies.lastIndexOf(movie) == 5
                                              ? 9
                                              : 5,
                                          context),
                                      buildCasTile(
                                          movies.lastIndexOf(movie) == 4
                                              ? 5
                                              : 4,
                                          context),
                                    ],
                                  ),
                                ),
                              ]),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCasTile(var index, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      width: 100,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ViewPage(
                      movie: movies[index],
                      movies: movies,
                    ),
                fullscreenDialog: true)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Image.network(
            API.REQUEST_IMG(movies[index].poster_path!),
            loadingBuilder: (_, child, progress) {
              if (progress == null) return child;
              return const CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }
}
