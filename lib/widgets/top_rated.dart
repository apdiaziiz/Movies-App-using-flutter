import 'package:flutter/material.dart';

import '../description.dart';

// TOP RATED CATEGORY MOVIES CLASS

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // CATEGORY TITLE
                  Text("Top Rated Movies",
                    style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                  SizedBox(height: 15,),
                ],
              ),
          ),
          SizedBox(height: 15,),
          // TOP RATED MOVIES CARDS
          Container(
            height: 200,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // TOP RATED EVENT HANDLER
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'],
                        bannerUrl: 'https://image.tmdb.org/t/p/w500' + toprated[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path'],
                        description: toprated[index]['overview'],
                        vote: toprated[index]['vote_average'].toString(),
                        lounchOn: toprated[index]['release_date'],)));
                    },
                    // CARD COVER IMAGE
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
                                        'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path']
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
