import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';



class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Map Argumentos = ModalRoute.of(context)!.settings.arguments as Map;

    Movie args = Argumentos['movie'];
    List<Movie> movies = Argumentos['controller'].movies.value.listMovies;

    Future<void> _launchUrl() async {
      final Uri _url = Uri.parse('https://www.youtube.com/results?search_query=${args.title} trailer');
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 41),
      body: Stack(
        children: [
          
          Container(
            height: 470,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500/${args.poster_path}'),
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
                ]
              )
            ),
          ),
          
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                          ]
                        )
                      ),
                      child: Stack(children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("Availlable Now"),
                            SizedBox(height: 10,),
                            Text("Watch Now", style: TextStyle(fontSize: 25),)
                          ]),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 30,
                          child: Container(
                            height: 65,
                            width: 65,
                            padding: const EdgeInsets.only(left:3),
                            decoration: const BoxDecoration(
                            color: Color(0xff5093C1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                                onPressed: _launchUrl,
                                icon: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
                              ),
                            )
                        )
                      ],
                    ),
                    ),
                    
                  ],
                ),
                const SizedBox(height: 0.0,),
                Container(
                  padding:const EdgeInsets.only(bottom: 30),
                  color: const Color(0xff404040),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("The Plot",
                            style:  TextStyle(fontSize: 21),),
                            const SizedBox(height: 15,),
                            Padding(padding: const EdgeInsets.only(right: 15), 
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(text: args.overview, style: const TextStyle(color:Color(0xffc0c0c0), fontFamily: 'Poppins')),
                                  const TextSpan(text: 'See more', style: TextStyle(color:Color(0xff5093C1), fontFamily: 'Poppins'))

                                ]
                                ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              RichText(text: const TextSpan(
                                style: TextStyle(fontSize:15, fontFamily: 'Poppins'),
                                children: <TextSpan>[
                                  TextSpan(text: 'Director:', style: TextStyle(color:Color(0xff5093C1))),
                                  TextSpan(text: 'Unknow')

                                ]
                                ),
                                
                              ),
                              const SizedBox(height: 20),
                              
                              RichText(text: const TextSpan(
                                style: TextStyle(fontSize:15, fontFamily: 'Poppins'),
                                children:  <TextSpan>[
                                  TextSpan(text: 'Writter:', style: TextStyle(color:Color(0xff5093C1))),
                                  TextSpan(text: 'Unknow')

                                ]
                                ),
                                
                              ),
                              const SizedBox(height: 30),
                              const Text("Other Films", style: TextStyle(fontSize: 21),),

                              SizedBox(height: 30),
                              Container(
                                height: 250,
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 10),
                                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    buildCasTile(movies[6], Argumentos['controller'], context),
                                    buildCasTile(movies[4], Argumentos['controller'], context),
                                    buildCasTile(movies[3], Argumentos['controller'], context), 
                                    buildCasTile(movies[5], Argumentos['controller'], context)
                                    
                                  ],
                                ),
                              ),

                          
                            ]
                        ),
                      )
                    ]
                    ),
                )
                
              ],
            ),
          ),
          Container(

            padding: EdgeInsets.only(top:30, left: 20, right: 10),
            child:IconButton(icon:const Icon(Icons.arrow_back, size: 40,), onPressed:()=>Navigator.of(context).pop(),),
          ),
        ],
      ),
    );


  }
  
  buildCasTile(Movie movie, MovieController cm, BuildContext context)
  {
    return Container(
      width: 110,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(right: 5),
      child:Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (() => Navigator.of(context).popAndPushNamed('/View', arguments: {'movie':movie, 'controller':cm})),
            child: Container(
            width: 110,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: Image != null ?  DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.poster_path}'),
                fit: BoxFit.cover,
                ) : null,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(right: 10), child: Text(movie.title, style: TextStyle(fontSize: 16),),)
        ],
        

      )
    );
  }
}

