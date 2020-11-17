import 'package:flutter/material.dart';
//import 'dart:typed_data';
//import 'package:feedback/feedback.dart';


class FeedBackPage extends StatefulWidget {

  @override
  State createState() => _FeedBackPageState();

}

class _FeedBackPageState extends State<FeedBackPage> {
  final feedbackText = TextEditingController();
  clearTextInput(){
    feedbackText.clear();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 247, 239, 1),
      appBar: AppBar(
        title: Text("Feedback"),
        backgroundColor: Color.fromRGBO(23, 114, 81, 1),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text("Please take some time to enter some feedback.",
          style: TextStyle(color: Color.fromRGBO(23, 114, 81, 1)),
          ),
          buildTextForm(),
          buildbutton()

        ],),)
      );
    }

    

    buildTextForm(){
      return Container(
        height: 200,
        child: Stack(
          children: <Widget>[
            TextField(
              controller: feedbackText,
              maxLines: 15,
              decoration: InputDecoration(
                hintText: "Please enter any thoughts you might have about the Nottinghamshire County Show.",
                hintStyle: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromRGBO(23, 114, 81, 1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(23, 114, 81, 1),))
              )
            ),
          ],
          ),
          );
    }

    buildbutton(){
      return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: clearTextInput,
              child: Text("Submit"),
            ),
      );
    }
        
}
