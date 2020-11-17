import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class AboutShowPage extends StatefulWidget {

  @override
  State createState() => _AboutShowPageState();

}


class _AboutShowPageState extends State<AboutShowPage> {


  @override
  Widget build(BuildContext context){
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/NCS1.jpg'),
          AssetImage('assets/images/NCS2.jpg'),
          AssetImage('assets/images/NCS3.jpg'),
          AssetImage('assets/images/NCS4.jpg'),
          AssetImage('assets/images/NCS5.jpg'),
          AssetImage('assets/images/NCS6.jpg'),
          AssetImage('assets/images/NCS7.jpg'),
          AssetImage('assets/images/NCS8.jpg'),
          AssetImage('assets/images/NCS9.jpg'),
          AssetImage('assets/images/NCS10.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),


      )
    );
    
    


    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1),
      appBar: AppBar(
        title: Text("About The Show"),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
      ),
      body:
      new ListView(children: <Widget>[
          image_carousel, 
          new Padding(padding: const EdgeInsets.all(16.0),
          child: new Text('A Great Day of Farming, Food & Family Fun',
          style: TextStyle(color: Color.fromRGBO(23, 114, 81, 1),fontSize: 30),),),
          new Padding(padding: const EdgeInsets.all(16.0),
          child: new Text('Join us at Newark Showground for an action-packed day showcasing the best of farming, countryside and rural life. Meet prize-winning cattle, sheep, goats and pigs and our finest local producers, alongside superb equine competitions, live-action displays and a host of new experiences. Make memories that will last a lifetime with a brilliant day for all the family.',
          style: TextStyle(color: Colors.black,fontSize: 15),),),
          new Padding(padding: const EdgeInsets.all(16.0),
          child: new Text('Address:The Showground, Lincoln Road,\nWinthorpe, Newark, NG24 2NY\nPhone:01636 705796\nFax:01636 675151',
          style: TextStyle(color: Colors.black,fontSize: 15),),),
          ],
      ),
      );

  }

}
