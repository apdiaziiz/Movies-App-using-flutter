import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../homePage.dart';
import 'footer.dart';

class TvOnTheAir extends StatefulWidget {
  //final List tvOnTheAir;
  const TvOnTheAir({Key? key}) : super(key: key);

  @override
  State<TvOnTheAir> createState() => _TvOnTheAirState();
}

class _TvOnTheAirState extends State<TvOnTheAir> {
  List tvOnTheAir = [];

  // API KEY
  final String Apikey = 'a491db18df9a598ebde09f3afb25d65d';
  // API TOKEN
  final ReadAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDkxZGIxOGRmOWE1OThlYmRlMDlmM2FmYjI1ZDY1ZCIsInN1YiI6IjYzMDMyZjExMDk3YzQ5MDA5MTEwZDBkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qWa4GgaKQHrNa9J4yMuTHnIqmiYPzmqXcsdbtc_yBHU';

  @override
  void initState(){
    super.initState();
    loadMovie();
  }

  //METHOD FECTHING DATA
  loadMovie()async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(Apikey, ReadAccessToken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        ));

    // MAP RESULTS INTO VARIABLE
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      tvOnTheAir = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BACKWARD ARROW ICON
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }), (route) {
                          return false;
                        });
                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    )
                  ],
                ),
              ),
              // ON THE AIR CATEGORY MOVIES COVER IMAGE
              Container(
                height: 4200,
                child: ListView.builder(itemCount: tvOnTheAir.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>TvDess(name: tvOnTheAir[index]['original_name'],
                          //   bannerUrl: 'https://image.tmdb.org/t/p/w500' + tvOnTheAir[index]['backdrop_path'],
                          //   posterUrl: 'https://image.tmdb.org/t/p/w500' + tvOnTheAir[index]['poster_path'],
                          //   description: tvOnTheAir[index]['overview'],
                          //   vote: tvOnTheAir[index]['vote_average'].toString(),
                          //   lounchOn: tvOnTheAir[index]['first_air_date'],)));
                        },
                        // COVER IMAGE
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                width: 400,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' + tvOnTheAir[index]['poster_path']
                                      ), fit: BoxFit.cover,
                                    )),
                              ),
                              ///Container(child: Text(upcoming[index]['title'] != null ? upcoming[index]['title'] : 'Loading...'),)
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      // CUSTOM FOOTER BAR
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

