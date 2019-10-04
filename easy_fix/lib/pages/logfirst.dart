import 'package:flutter/material.dart';

class FirstlogPage extends StatefulWidget{
  @override
  _FirstlogPageState createState() => _FirstlogPageState();
}

class _FirstlogPageState extends State<FirstlogPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100,
                child: Image.asset(
                  "assets/logo.jpg",
                  fit: BoxFit.contain,
                  ),
                  ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}