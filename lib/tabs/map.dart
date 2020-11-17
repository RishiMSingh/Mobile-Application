import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'zoombuttons_plugin_option.dart';

class MapTab extends StatefulWidget {

  MapTab() : super();
  @override
  _MapPageState createState() => _MapPageState(); 

}

class _MapPageState extends State<MapTab> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0));
  @override
  Widget build(BuildContext context) {

    var eventsPics = ["assets/images/Cowshowing.jpg","assets/images/MountedGames.jpg","assets/images/GiantTurtles.jpg","assets/images/Sheep.jpg","assets/images/Military.jpg","assets/images/WorkingHunter.jpg"];
    var overlayImages = new List<OverlayImage>();
    var overlayImage = OverlayImage(
          bounds: LatLngBounds(LatLng(53.108260, -0.819801), LatLng(53.0745132, -0.7048907)),
          opacity: 1.0,
          imageProvider: Image.asset('assets/images/map.png').image);
    overlayImages.add(overlayImage);

    return SlidingUpPanel(
      parallaxEnabled: true,
      minHeight: 70,
      panel: Center(
        child: new Container(
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.only(right:20),
                width:175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: new AssetImage(eventsPics[index]),fit: BoxFit.fill,),
                ),
              );
              },

            )
            ),
            
      ),
      
      collapsed: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: radius,
        ),
        child: Center( 
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                child: Text(
                  "Explore",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: FlutterMap(
          options: new MapOptions(
            center: new LatLng(53.098737, -0.767921),
            minZoom: 13.5,
            maxZoom: 16,
            zoom: 15.0,
            swPanBoundary: LatLng(53.070045, -0.824017),
            nePanBoundary: LatLng(53.109460, -0.687693),
            plugins: [
              ZoomButtonsPlugin(),
            ],
          ),
          layers: [
            TileLayerOptions(
              tileProvider: AssetTileProvider(),
              maxZoom: 16.0,
              urlTemplate: 'assets/images/blank-map.png',
            ),
            new OverlayImageLayerOptions(overlayImages: overlayImages),
            ZoomButtonsPluginOption(
              minZoom: 4,
              maxZoom: 19,
              mini: true,
              padding: 10,
              alignment: Alignment.topRight
            )
          ],
        )
      ),
      borderRadius: radius,
    );

  }

}
