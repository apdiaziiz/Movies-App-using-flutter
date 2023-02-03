import 'package:flutter/material.dart';
import 'package:som_movies/widgets/onTheAir.dart';
import 'package:som_movies/widgets/profile.dart';
import 'package:som_movies/widgets/search.dart';
import 'homePage.dart';

// MAIN METHOD
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111D),
        primaryColor: Colors.white,
      ),
        // PAGE ROUTES
        routes: {
          "/" : (context) => HomePage(),
          "search" : (context) => SearchMovie(),
          "user" : (context) => UserProfile(),
          "category" : (context) => TvOnTheAir(),
        }
    );
  }
}


