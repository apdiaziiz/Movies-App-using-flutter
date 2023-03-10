import 'package:flutter/material.dart';

// HEADER CLASS
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 10,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // APP TITLE
                      Text('TMDB Movies',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.w900,
                      ),
                      ),
                    ],
                  ),
                  // USER PROFILE IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("images/profile.jpeg",
                    height: 60,
                    width: 60,),
                  )
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }

  // HEADER HEIGHT
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
      double.infinity,
      100);
}
