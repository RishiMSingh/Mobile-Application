import 'package:flutter/material.dart';
import 'package:nottinghamshire_county_show/pages/competitionsview.dart';

class CompetitionsTab extends StatefulWidget {

  CompetitionsTab() : super();

  @override
  _CompetitionsTabState createState() => _CompetitionsTabState(); 

}

class Competitions {
  String name;
  String description;
  String time;
  String image;

  Competitions({this.image, this.name, this.time});
}

List comp = [
  Competitions(
    image: "assets/images/horses.jpg",
    name: "Find the horse",
    time: "09:30-14:40"
  ),
  Competitions(
    image: "assets/images/horses.jpg",
    name: "Find the horse",
    time: "10:30-12:40"
  ),
  Competitions(
    image: "assets/images/horses.jpg",
    name: "Race the horse ",
    time: "2:30-4:40"
  ),
  Competitions(
    image: "assets/images/horses.jpg",
    name: "Who will win?",
    time: "1:30-2:40"
  )
];

class _CompetitionsTabState extends State<CompetitionsTab> {

   @override
  Widget build(BuildContext context) {

    //List<Competitions> comp = NottsCountyShow.getController().getExhibitors();

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
            child: ListView.builder(
              itemCount: comp.length,
              itemBuilder: (context, index) {
                return ListTile(leading: Image.asset(comp[index].image),title: Text(comp[index].name), subtitle: Text(comp[index].time),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CompetitionViewPage(1)));
                  },
                );
              }                
              ),
              
            ),
        ]
      )
    );

  }

}
