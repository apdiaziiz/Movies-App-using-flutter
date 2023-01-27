import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, lounchOn;

  const Description({Key? key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.lounchOn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: 210,
                    child: Image.network(
                      bannerUrl, fit: BoxFit.cover,),
                  )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 250,
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Container(padding: EdgeInsets.only(left: 10),
                    child: Text('Average rated - ' + vote),),
                  Container(padding: EdgeInsets.all(10),
                    child: Text(name != null ? name : 'not loaded...'),),
                  Container(padding: EdgeInsets.only(left: 10),
                    child: Text('Released on - ' + lounchOn ),),
                ],
              ),
            )

            // Row(
            //   children: [
            //     Container(
            //       margin: EdgeInsets.all(10),
            //       height: 200,
            //       width: 100,
            //       child: Image.network(posterUrl),
            //     ),
            //     // Flexible(child: Container(
            //     //   child: Text(description),
            //     // ))
            //   ],
            // ),
          ],
      ),
    );
  }
}
