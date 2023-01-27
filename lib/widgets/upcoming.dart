import 'package:flutter/material.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;

  const UpcomingMovies({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming Movies"),
          SizedBox(height: 15,),
          Container(
            height: 200,
            child: ListView.builder(itemCount: upcoming.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return InkWell(
                onTap: (){

                },
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
