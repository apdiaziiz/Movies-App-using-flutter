import 'package:flutter/material.dart';

import '../description.dart';

// TV MOVIES CLASS
class TvMovies extends StatelessWidget {
  final List tv;

  const TvMovies({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TV POPULAR MOVIES TITLE
          Text("Popular Tv Shows Movies",
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          // TV CARDS
          Container(
            height: 150,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  // EVENT HANDLER
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: tv[index]['name'],
                        bannerUrl: 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path'],
                        description: tv[index]['overview'],
                        vote: tv[index]['vote_average'].toString(),
                        lounchOn: tv[index]['first_air_date'],)));
                    },
                    // CARD COVER IMAGE
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path']
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
    );
  }
}
