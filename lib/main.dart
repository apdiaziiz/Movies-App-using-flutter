import 'package:flutter/material.dart';
import 'package:som_movies/widgets/top_rated.dart';
import 'package:som_movies/widgets/trending.dart';
import 'package:som_movies/widgets/tv.dart';
import 'package:som_movies/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List upCommingMovies = [];
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvMovies = [];

  final String Apikey = 'a491db18df9a598ebde09f3afb25d65d';
  final ReadAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDkxZGIxOGRmOWE1OThlYmRlMDlmM2FmYjI1ZDY1ZCIsInN1YiI6IjYzMDMyZjExMDk3YzQ5MDA5MTEwZDBkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qWa4GgaKQHrNa9J4yMuTHnIqmiYPzmqXcsdbtc_yBHU';
  @override
  void initState(){
    loadMovie();
    super.initState();
  }

  loadMovie()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(Apikey, ReadAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));

    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      upCommingMovies = upcomingresult['results'];
      trendingMovies = trendingresult['results'];
      topRatedMovies = topratedresult['results'];
      tvMovies = tvresult['results'];
    });
    print(tvMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Som-Movies App')),
      body: ListView(
          children: [
            UpcomingMovies(upcoming: upCommingMovies,),
            TvMovies(tv: tvMovies),
            TrendingMovies(trending: trendingMovies,),
            TopRatedMovies(toprated: topRatedMovies)
          ],
      ),
    );
  }
}



