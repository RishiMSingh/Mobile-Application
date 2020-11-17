import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/exhibitor.dart';

class DataController {

  String _url;
  List<Exhibitor> exhibitors;
  

  DataController(String url) {
    this._url = url;
  }

  void download() async {
    this.exhibitors = new List<Exhibitor>();
    http.Response response = await http.get('https://' + this._url + '/api/v1/exhibitors/all');
    for (var k in json.decode(response.body)) {
      print("Loaded " + k["exhibitor_name"]);
      Exhibitor e = new Exhibitor(k['exhibitor_id'], k['exhibitor_name'], k['exhibitor_description'], k["exhibitor_website"]);
      this.exhibitors.add(e);
    }
  }

  String getUrl() {
    return this._url;
  }

  Future checkConnection() async {
    http.Response response = await http.get('https://' + this._url + '/api');
    return response;
  }

  List<Exhibitor> getExhibitors() {
    return exhibitors;
  }

  Exhibitor getExhibitor(int id) {
    for (Exhibitor e in this.exhibitors) {
      if (e.getId() == id) {
        return e;
      }
    }
    return null;
      
  }

}