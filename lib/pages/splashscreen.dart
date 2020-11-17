import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState(); 

}

class _SplashScreenState extends State<SplashScreen>{
  @override  
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 5),() // time of how long the splash screen will be shown for.
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NottsCountyShow(), //after the splash screen is shown the main page is shown.
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){

    SystemChrome.setPreferredOrientations([ // device orientations
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1), //specified background colour
      body: Stack( 
        children: [
          Positioned.fill(
            child: Image(
              image: Image.asset('assets/images/splash-bottom.png').image, //image inseted for the bottom design of splashs screen
              fit: BoxFit.fitWidth, // image fit
              alignment: Alignment.bottomCenter, //positin of image
            ), 
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: Image.asset('assets/images/flags.png').image, // top design of splash screen
                  alignment: Alignment.topRight,
                )
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 25), 
                  child: Image(
                    image: Image.asset('assets/images/logo.jpg').image // logo 
                  ),
                )
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30), //padding around the image
                  child: Image(
                    image: Image.asset('assets/images/title.png').image // title image
                  )
                )
              ),
              Center(
                child: Padding(
                padding: EdgeInsets.fromLTRB(60, 5, 60, 5),
                child: Text(
                  "PARTNERED WITH", //text used on splash screen 
                  textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: 'Gilroy', //font style chosen
                      fontSize: 16.0, // font size
                      color: Color.fromRGBO(216, 65, 108, 1) //font colour
                    )
                  )
                ) 
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: Image(
                    image: Image.asset('assets/images/ntu.png').image  //NTU logo
                  )
                ),
              ),      
            ],
          ),
        ]
      )
    );

  }

}
