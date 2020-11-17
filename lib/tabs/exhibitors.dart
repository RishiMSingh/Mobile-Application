import 'package:flutter/material.dart';
import '../main.dart';
import '../model/exhibitor.dart';
import '../pages/exhibitorview.dart';

class ExhibitorsTab extends StatefulWidget {

  ExhibitorsTab() : super();

  @override
  _ExhibitorsPageState createState() => _ExhibitorsPageState(); 

}

class _ExhibitorsPageState extends State<ExhibitorsTab> {

  @override
  Widget build(BuildContext context) {

    List<Exhibitor> exhibitors = NottsCountyShow.getController().getExhibitors();

    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(7),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for an exhibitor...'
              ),
            ),
          ),
          new Expanded(
            child: ListView.separated(
              itemCount: exhibitors.length,
              itemBuilder: (context, index) {
                return ListTile(leading:Image.asset("assets/images/ntu.png"), //exhibitors[index.getImage]
                  title: Text(exhibitors[index].getName()), 
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExhibitorViewPage(1)));
                  }                
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ]
      )
    );

  }

}