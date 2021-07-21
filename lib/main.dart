import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DyanmicList();
}
class DyanmicList extends State<ListDisplay> {
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Playlist Lagu'),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: eCtrl,
            onSubmitted: (text) {
              litems.add(text);  // Append Text to the list
              eCtrl.clear();     // Clear the Text area
              setState(() {});   // Redraw the Stateful Widget
            },
          ),
          SizedBox(height: 20.0),
          new Expanded(
            child: new ListView.builder
              (
                padding: EdgeInsets.all(10.0),
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return new Text(litems[Index]);
                }
            ),
          )
        ],
      ),
    );
  }
}