import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:nottinghamshire_county_show/pages/scale_layer_plugin_option.dart';
import 'package:user_location/user_location.dart';
import 'package:latlong/latlong.dart';

import '../tabs/zoombuttons_plugin_option.dart';

class FindMyCarPage extends StatefulWidget {

  @override
  State createState() => _FindMyCarPageState();

}

class _FindMyCarPageState extends State<FindMyCarPage> {
  

  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;

  List<LatLng> carLocations = [];

  

  @override
  Widget build(BuildContext context){
    var markers = carLocations.map((latlng) {
      return Marker(
        width: 30.0,
        height: 30.0,
        point: latlng,
        builder: (ctx) => Container(
          child: FlutterLogo(),
        ),
      );
    }).toList();

    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      markers: markers,
      onLocationUpdate: (pos) =>
            print("onLocationUpdate ${pos.toString()}"),
      updateMapLocationOnPositionChange: false,
      showMoveToCurrentLocationFloatingActionButton: true,
      zoomToCurrentLocationOnLoad: false,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1),
      appBar: AppBar(
        title: Text("Find My Car"),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
      ),
      body: Column(
        children: [
          
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(53.098634, -0.769815),
                zoom: 13.0,
                plugins: [
                  UserLocationPlugin(),
                  ZoomButtonsPlugin(),
                  ScaleLayerPlugin(),
                ],
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiaWdhdXJhYiIsImEiOiJjazFhOWlkN2QwYzA5M2RyNWFvenYzOTV0In0.lzjuSBZC6LcOy_oRENLKCg',
                  'id': 'mapbox.streets',
                },
                tileProvider: NonCachingNetworkTileProvider(),
                
                ),
                ScaleLayerPluginOption(
                    lineColor: Colors.blue,
                    lineWidth: 2,
                    textStyle: TextStyle(color: Colors.blue, fontSize: 12),
                    padding: EdgeInsets.all(10),
                ),
              
                MarkerLayerOptions(markers: markers),
              
                userLocationOptions,
                
                ZoomButtonsPluginOption(
                  minZoom: 4,
                  maxZoom: 19,
                  mini: true,
                  padding: 10,
                  alignment: Alignment.topRight
                ),
                

                
              ],
              
              mapController: mapController,
              
              
              
            )
          ),
          Container(
            child: RaisedButton(
              child: Text("Set Car Location"),
              onPressed: _setLocation,
              color: Colors.green,

              )
          ),
        ],
      )
    );

  }

  void _setLocation() {
    setState(() {
      carLocations.add(LatLng(53.098634, -0.769815));
    });
  }

}
