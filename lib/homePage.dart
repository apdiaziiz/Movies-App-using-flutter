import 'package:flutter/material.dart';
import 'package:som_movies/widgets/footer.dart';
import 'package:som_movies/widgets/header.dart';
import 'package:som_movies/widgets/top_rated.dart';
import 'package:som_movies/widgets/trending.dart';
import 'package:som_movies/widgets/tv.dart';
import 'package:som_movies/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List upCommingMovies = [];
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvMovies = [];
  //
  final String Apikey = 'a491db18df9a598ebde09f3afb25d65d';
  final ReadAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDkxZGIxOGRmOWE1OThlYmRlMDlmM2FmYjI1ZDY1ZCIsInN1YiI6IjYzMDMyZjExMDk3YzQ5MDA5MTEwZDBkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qWa4GgaKQHrNa9J4yMuTHnIqmiYPzmqXcsdbtc_yBHU';
  @override
  void initState(){
    loadMovie();
    super.initState();
  }

  loadMovie()async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(Apikey, ReadAccessToken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        ));

    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      upCommingMovies = upcomingresult['results'];
      trendingMovies = trendingresult['results'];
      topRatedMovies = topratedresult['results'];
      tvMovies = tvresult['results'];
    });
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: ListView(
        children: [
          UpcomingMovies(upcoming: upCommingMovies,),
          TvMovies(tv: tvMovies),
          TrendingMovies(trending: trendingMovies,),
          TopRatedMovies(toprated: topRatedMovies),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}




