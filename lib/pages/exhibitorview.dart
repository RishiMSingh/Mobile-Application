import 'package:flutter/material.dart';

import '../main.dart';
import '../model/exhibitor.dart';


Exhibitor exhibitor;

class ExhibitorViewPage extends StatefulWidget {

  ExhibitorViewPage(int id) {
    exhibitor = NottsCountyShow.getController().getExhibitor(id);
  }

  @override
  State createState() => _ExhibitorViewPageState();

}

class _ExhibitorViewPageState extends State<ExhibitorViewPage> {


  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1),
      appBar: AppBar(
        title: Text(exhibitor.getName()),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
      ),
      body: Stack(
        children: <Widget>[
          _coverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height/3),
                  _exhibitorTitle(),
                  SizedBox(height: screenSize.height/100),
                  _buildDescription(context)
                  
                ],) ,) ,)
          
        ],
      )
    );

  }

  Widget _coverImage(Size screenSize){
    return Container(

      height: screenSize.height /3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ntu.png"),/*competition.getimage*/
          fit: BoxFit.cover,
        )
      ),
      );
  }

  Widget _exhibitorTitle(){
    TextStyle _compName = TextStyle(
      
      color: Color.fromRGBO(23, 114, 81, 1),
      fontSize: 36.0,
      fontWeight: FontWeight.w700
    );
    return Container(
      
      child: Text(exhibitor.getName(), //getName,
        style: _compName,
      )
    );
  }

  Widget _buildDescription(BuildContext context){
    TextStyle _compDescription = TextStyle(
      color: Color.fromRGBO(23, 114, 81, 1),
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
    );

    return Container(
      
      //margin: EdgeInsets.all(left:4,),
      //padding: EdgeInsets.all(4.0),
      child: Text("Description\n" + exhibitor.getDescription(), //getName,
        style: _compDescription,
      )
    );
  }
}

