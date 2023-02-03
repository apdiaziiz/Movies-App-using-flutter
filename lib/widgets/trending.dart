import 'package:flutter/material.dart';
import 'package:som_movies/description.dart';

// TRENDING MOVIES CLASS
class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TRENDING MOVIE TITLE
          Text("Trending Movies",
            style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          // TRENDING CARDS
          Container(
            height: 200,
            child: ListView.builder(itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // TRENDING EVENT HANDLER
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                          description: trending[index]['overview'],
                          vote: trending[index]['vote_average'].toString(),
                          lounchOn: trending[index]['release_date'],)));
                    },
                    // TRENDING COVER IMAGE
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                                )
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
    );
  }
}
