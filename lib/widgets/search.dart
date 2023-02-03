import 'package:flutter/material.dart';
import 'package:som_movies/homePage.dart';
import 'package:som_movies/widgets/footer.dart';

// SEARCH WIDGET CLASS
class SearchMovie extends StatelessWidget {
  const SearchMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BACK TO HOMEPAGE EVENT
                    InkWell(
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }), (route) {
                          // if( route is (MaterialPageRoute('/')))
                          // {

                          // }
                          // print(route);
                          return false;
                        });
                      },
                      // BACKWARD ICON
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    )
                  ],
                ),
              ),
              // INPUT FIELD SECTION
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF292B37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // SEARCH ICON
                    Icon(
                      Icons.search,
                      color: Colors.white30,
                      size: 30,),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 300,
                      // INPUT FIELD
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search movie",
                          hintStyle: TextStyle(color: Colors.white30)
                        ),

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // CUSTOM FOOTER
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
