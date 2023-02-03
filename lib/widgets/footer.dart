import 'package:flutter/material.dart';
import 'package:som_movies/widgets/onTheAir.dart';
import 'package:som_movies/widgets/profile.dart';
import 'package:som_movies/widgets/search.dart';

import '../homePage.dart';

// CUSTOM FOOTER BAR CLASS

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // FOOTER HOME ICON
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, '/');
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => HomePage()), (r) => false);
            },
            child: Icon(
              Icons.home,
              size: 35,
              color: Colors.blue,
            ),
          ),
          // FOOTER CATEGORY ICON
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'category');
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => TvOnTheAir()), (r) => false);
            },
            child: Icon(
              Icons.category,
              size: 35,
              color: Colors.blue,
            ),
          ),
          // FOOTER SAERCH ICON
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'search');
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => SearchMovie()), (r) => false);
            },
            child: Icon(
              Icons.search,
              size: 35,
              color: Colors.blue,
            ),
          ),
          // FOOTER USER ICON
          InkWell(
            onTap: () {
              //Navigator.pushNamed(context, 'user');
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => UserProfile()), (r) => false);
            },
            child: Icon(
              Icons.person,
              size: 35,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
