import 'package:flutter/material.dart';

import '../homePage.dart';
import 'footer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BAKC TO HOMEPAHE EVENT
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }), (route) {
                          return false;
                        });
                      },
                      // BACKWARD ARROW ICON
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    )
                  ],
                ),
              ),

                // USER PROFILE SECTION

                Container(
                  width: 500,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // PROFILE USER IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset("images/profile.jpeg",
                          height: 100,
                          width: 100,),
                      ),
                      SizedBox(height: 30,),
                      // PROFILE USER NAME
                      Text("Abdiaziz Aqani",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 20,),
                        // WATCH LIST SECTION
                        Container(
                          //padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    // WATCH LIST TITLE
                                    Text("Watch List",
                                      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              // WATCH LIST MOVIES
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for(int i=1; i<6; i++)
                                    Padding(padding: EdgeInsets.only(left: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset("assets/img$i.jpg",
                                          height: 150,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        )
                    ],
                  )
                ),
              // SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // CUSTOM FOOTER
      bottomNavigationBar: CustomNavBar(),
    );
  }
}