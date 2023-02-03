import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, lounchOn;

  const Description({Key? key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.lounchOn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: SafeArea(
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(child:
                        Container(padding: EdgeInsets.all(20),height: 250,width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              bannerUrl, fit: BoxFit.cover,),
                          ),)),
                      ],

                    ),

                  ),
                  SizedBox(height: 10,),
                  // MOVIE TITLE
                  Container(padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Text(name != null ? name : 'not loaded.',
                          style: const TextStyle(fontSize: 20, color: Colors.white))),
                  // MOVIE AVERAGE RATED
                  Container(padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text('Average rated - ⭐ ' + vote, style: TextStyle(color: Colors.white),),),
                  // MOVIE RELEASED TIME
                  Container(padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text('Released on - ' + lounchOn, style: TextStyle(color: Colors.white), ),),
                  // MOVIE OVERVIEW
                  Container(padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    width: MediaQuery.of(context).size.width * 10,
                    child: Text(description,
                      style: TextStyle(fontSize: 15, color: Colors.white),),),
                  // DESCRIPTION BUTTONS
                  Container(padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Wrap(
                      children: [
                        Row(
                          children: [
                            // TRAILER BUTTON
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.amber)
                              ),
                              onPressed: () {},
                              child: const Text('Trailer',
                                style: const TextStyle(color: Colors.black),),
                            ),
                            const SizedBox(width: 10),
                            // WATCH NOW BUTTON
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red)
                              ),
                              onPressed: () {},
                              child: const Text('Watch'),
                            ),
                          ],
                        )
                      ],
                    ),)
                ],
              ),
    ),
      ),
    );
  }
}
