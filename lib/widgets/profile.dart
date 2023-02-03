import 'package:flutter/material.dart';

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
                  width: 500,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset("images/profile.jpeg",
                          height: 100,
                          width: 100,),
                      ),
                      SizedBox(height: 30,),
                      Text("Abdiaziz Aqani",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 20,),
                        Container(
                          //padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text("Watch List",
                                      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
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
      bottomNavigationBar: CustomNavBar(),
    );
  }
}