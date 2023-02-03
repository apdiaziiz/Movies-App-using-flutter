import 'package:flutter/material.dart';

import '../description.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;

  // UPCOMING MOVIES CLASS
  const UpcomingMovies({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // UPCOMING TITLE
          Text("Upcoming Movies",
          style: const TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          // UPCOMING CARDS
          Container(
            height: 200,
            child: ListView.builder(itemCount: upcoming.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              // UPCOMING EVENT HANDLER
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: upcoming[index]['title'],
                    bannerUrl: 'https://image.tmdb.org/t/p/w500' + upcoming[index]['backdrop_path'],
                    posterUrl: 'https://image.tmdb.org/t/p/w500' + upcoming[index]['poster_path'],
                    description: upcoming[index]['overview'],
                    vote: upcoming[index]['vote_average'].toString(),
                    lounchOn: upcoming[index]['release_date'],)));
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
                            'https://image.tmdb.org/t/p/w500' + upcoming[index]['poster_path']
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
