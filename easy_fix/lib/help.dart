import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget{
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Help",
        style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}