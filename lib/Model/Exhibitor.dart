import 'package:latlong/latlong.dart';

class Exhibitor {

  int _id;
  String _name;
  String _description;
  String _url;  
  double _longitude;
  double _latitude;
  //StandArea _area; <- Rishi is working on this class

  Exhibitor(int id, String name, String description, String url) {
    this._id = id;
    this._name = name;
    this._description = description;
    this._url = url;
  }

  int getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getDescription() {
    if (this._description == null) {
      return "";
    }
    return this._description.replaceAll("<p>", "").replaceAll("</p>", "");
  }

  String getUrl() {
    if (this._url == null) {
      return "No website found";
    }
    return this._url;
  }

  double getLongitude() {
    return this._longitude;
  }

  double getLatitude() {
    return this._latitude;
  }

  LatLng getLocation() {
    return LatLng(this._latitude, this._longitude);
  }

  void setLngLat(double long, double lat) {
    this._longitude = long;
    this._latitude = lat;
  }

}