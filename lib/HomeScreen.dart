import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:web_portfolio/VideoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,

        child: Stack(
          children: <Widget>[
            //make curves for desgining

            ClipPath(
              child: Container(
                color: Colors.blue[400],
                height: 140,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            ClipPath(
              child: Container(
                color: Colors.blue[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),

            //lets make content
            //lets first make content for small screens that is less than 580

            screenSize.width < 580 ?
            Container(
              //for small
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                children: <Widget>[
                  //Lets make container for picture

                  Container(
                    margin: EdgeInsets.only(top: 64),
                    height: 240,
                    child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 16,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Easy Approach", style: TextStyle(fontSize: kIsWeb ? 64 : 32, fontWeight: FontWeight.w700, color: Colors.lightBlue),),
                          SizedBox(height: 8,),
                          Text("Easy Approach makes it easy for every one to dessiminate knowledge, and making "
                              "difficult problems easy to solve", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                          SizedBox(height: 16,),
                          
                          FlatButton.icon(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoScreen()
                                ));
                              },
                              icon: Icon(Icons.video_library), 
                              label: Text("See all Videos"),
                            color: Colors.grey[800],
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32))
                            ),
                          )
                        ],
                      ),
                    ),
                  )


                ],
              ),

            ) :

            Container(
              //for large screens
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text("Easy Approach", style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700, color: Colors.lightBlue),),
                                SizedBox(height: 8,),
                                Text("Easy Approach makes it easy for every one to dessiminate knowledge, and making "
                                    "difficult problems easy to solve", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                                SizedBox(height: 16,),

                                FlatButton.icon(
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => VideoScreen()
                                    ));
                                  },
                                  icon: Icon(Icons.video_library),
                                  label: Text("See all Videos"),
                                  color: Colors.grey[800],
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(32))
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                        
                        Expanded(
                          child: Container(
                            child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )



          ],
        ),

      ),
    );
  }
}
