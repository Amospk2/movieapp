import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';

import '../utils/api.utils.dart';

class CustomListCard extends StatelessWidget {
  final Movie movie;
  final MovieController controllerM;
  const CustomListCard({Key? key, required this.movie, required this.controllerM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('/View', arguments: {'movie': movie, 'controller':controllerM});
        
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black54,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(API.REQUEST_IMG(movie.poster_path)),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline5,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),

                  Spacer(),
                  Text("Popularidade:" + movie.popularity.toString()),
                  SizedBox(
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
