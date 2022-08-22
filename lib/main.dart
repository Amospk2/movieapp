import 'package:flutter/material.dart';

import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/view_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/home',
      routes: {
        '/home':(_) => HomePage(),
        '/View':(_) => ViewPage(),
      },
    );
  }
}
