import 'package:flutter/material.dart';


class CompetitionViewPage extends StatefulWidget {
  CompetitionViewPage(int i);

  @override
  State createState() => _CompetitionViewPageState();

}

class _CompetitionViewPageState extends State<CompetitionViewPage> {

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1),
      appBar: AppBar(
        title: Text("Competition"/*competition.getName*/),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
      ),
      body: Stack(
        children: <Widget>[
          _coverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height/2.9),
                  _competitonTitle(),
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
          image: AssetImage("assets/images/horses.jpg"),/*competition.getimage*/
          fit: BoxFit.cover,
        )
      ),
      );
  }

  Widget _competitonTitle(){
    TextStyle _compName = TextStyle(
      color: Colors.black,
      fontSize: 36.0,
      fontWeight: FontWeight.w700
    );
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      //padding: EdgeInsets.all(4.0),
      child: Text(
        "Competition", //getName,
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
      color: Theme.of(context).scaffoldBackgroundColor,
      //margin: EdgeInsets.all(left:4,),
      //padding: EdgeInsets.all(4.0),
      child: Text(
        "Description", //getName,
        style: _compDescription,
      )
    );
  }

}


