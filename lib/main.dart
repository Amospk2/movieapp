import 'package:flutter/material.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/features/movie/presentation/ui/pages/home_page.dart';


void main() {
  Inject.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
      
    );
  }
}
