import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fix/home.dart';

class VehiclePage extends StatefulWidget{
  String phoneNumber;
  VehiclePage({this.phoneNumber});
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _editingController = TextEditingController();
  bool _isSigningIn = false;
  @override
  
  Widget build(BuildContext context) {

    final nextButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _isSigningIn = true;

          });
          Firestore.instance.collection("users").document(widget.phoneNumber).setData({
            
          }).then((_){
            setState(() {
              _isSigningIn = false;
            });
            print("complite");
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>HomePage()));
          }).catchError((err){
            setState(() {
              _isSigningIn = false;
            });
            print(err);
          });

        },
        child: Text(
          "Resgister",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return new Scaffold(
      body:Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isSigningIn ? LinearProgressIndicator() : SizedBox.shrink(),
                  Spacer(),
                  Image.asset(
                      "assets/logo.jpg",
                      fit: BoxFit.contain,
                    ),
                  SizedBox(height: 8.0),
                  SizedBox(height: 10.0,),
                  nextButon,
                  Spacer()
                  
                ],
              ),
            ),
          ),
        ),
    );
  }
}

