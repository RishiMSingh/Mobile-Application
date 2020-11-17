import 'package:flutter/material.dart';
import 'package:nottinghamshire_county_show/pages/aboutshow.dart';
import 'pages/splashscreen.dart';
import 'pages/feedback.dart';
import 'pages/findmycar.dart';
import 'tabs/map.dart';
import 'tabs/exhibitors.dart';
import 'tabs/competitions.dart';
import 'tabs/schedule.dart';
import 'controller.dart';

DataController controller;

void main() async {

  controller = new DataController("newark-showground.jacobboddey.uk");
  await controller.download();

  runApp(
    new MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent,accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen()
    )
  );

}
var globalContext;
class NottsCountyShow extends StatelessWidget {
  

  static DataController getController() {
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      title: 'Notts County Show',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Nottinghamshire County Show'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static List<Widget> widgets = <Widget>[
    MapTab(),
    ExhibitorsTab(),
    ScheduleTab(),
    CompetitionsTab()
  ];

  static List<String> titles = <String>[
    "Nottinghamshire County Show", 
    "Exhibitors", 
    "What's On",
    "Competitions"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titles.elementAt(_selectedIndex)),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
        actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right:20.0),
          child: GestureDetector(
            onTap: (){
              alertDialog(context);
            },
            child: Icon(Icons.more_vert),
          ),
        ),
      ],
      ),
      body: Center(
        child: widgets.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/images/menu-header.jpg').image,
                  fit: BoxFit.cover
                )
              ),
              child: null,
            ),
            ListTile(
              title: Text('About the Show'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutShowPage()));
              },
              leading: Icon(Icons.info)
            ),
            ListTile(
              title: Text('My Favourites'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.star)
            ),
            ListTile(
              title: Text('Find My Car'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FindMyCarPage()));
              },
              leading: Icon(Icons.directions_car)
            ),
            ListTile(
              title: Text('Social Media'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.laptop_mac)
            ),
            ListTile(
              title: Text('Leave Feedback'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedBackPage()));
              },
              leading: Icon(Icons.forum)
            ),
            Divider(),
            ListTile(
              title: Text('About This App'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.phone_iphone)
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.help)
            ),
            ListTile(
              title: Text('Privacy'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.data_usage)
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
        selectedIconTheme: IconThemeData(
          color: Colors.white
        ),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('Exhibitors')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('What\'s On')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Competitions')
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void alertDialog(BuildContext context){
    var alert = new AlertDialog(
      title: new Text("Coronavirus Update."),
      content:new Text("Due to developments with the COVID-19 virus, the Newark & Nottinghamshire Agricultural Society has had to make the difficult decision to cancel the 2020 Nottinghamshire County Show."),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Okay",
          style: TextStyle(fontSize: 20)
          ),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        ),
        new FlatButton(child: new Text("More Information",
          style: TextStyle(fontSize: 20)
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutShowPage()));
            Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        )
      ],
    );

    showDialog(context: context, builder:(BuildContext c){
      return alert;
    },
    );
  }

}
