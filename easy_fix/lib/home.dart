import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
  
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Easy Fix"),
      ),
    );
  }

  
}