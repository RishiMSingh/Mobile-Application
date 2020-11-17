import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScheduleTab extends StatefulWidget{

  ScheduleTab() : super();

  @override
  _SchedulePageState createState() => _SchedulePageState(); 
  
}

class _SchedulePageState extends State<ScheduleTab> {
  @override
  Widget build(BuildContext context) {
    var events = ["COW SHOWING","MOUNTED GAMES\nCOMPETITION","GIANT TORTOISES","THE SHEEP SHOW","MILITARY","WORKING HUNTER"];
    var eventsPics = ["assets/images/Cowshowing.jpg","assets/images/MountedGames.jpg","assets/images/GiantTurtles.jpg","assets/images/Sheep.jpg","assets/images/Military.jpg","assets/images/WorkingHunter.jpg"];
    var eventcontent = ["Come join us at the cow show. 9-10AM","You’ll be amazed at the skill and speed of our talented riders and ponies.\n3-5PM","Come and meet these unforgettable characters in the Countryside Area.\n1-3PM","A fun and interactive learning experience for all the family.\n11-2PM","A fantastic opportunity to find out more about the British Armed Forces.\n1-3PM","Come and cheer them on as they compete in a range.\n2-4PM"];
    var myGridView = new GridView.builder(
    itemCount: events.length,
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
    itemBuilder: (BuildContext context, int index){
      return new GestureDetector(
        child: new Card(
          elevation: 5.0,  
          child: new Container(
            decoration: new BoxDecoration(
              image: DecorationImage(image: new AssetImage(eventsPics[index]),fit: BoxFit.fill,)
            ),
            child:Container(
              margin: const EdgeInsets.only(top: 140.0, left: 10),
              child: Text(events[index],style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
              )
          ),
          ),
            onTap: (){
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title:new Column(children: <Widget>[
                    new Text(events[index])
                  ],
                  ),
                  content: new Text(eventcontent[index]),
                
                  actions: <Widget> [
                      new FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop('dialog');
                        },
                        child: new Text("Ok")),
                    ]
                  )
                );
            }
          );
        }
    );
    return Scaffold(
      body: myGridView,
    );
  }
}
