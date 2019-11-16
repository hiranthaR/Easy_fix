import 'dart:async';
import 'package:easy_fix/logfirst.dart';
import 'package:flutter/material.dart';
import 'package:easy_fix/freeworks.dart';
import 'package:easy_fix/help.dart';
import 'package:easy_fix/payment.dart';
import 'package:easy_fix/setting.dart';
import 'package:easy_fix/yourworks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _controller;

  Location _locationService = Location();
  bool _permission = false;
  Marker _marker;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  initState() {
    super.initState();
    initLocation();
  }

  initLocation() async {
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          final location = await _locationService.getLocation();

          final _currentCameraPosition = CameraPosition(
              target: LatLng(location.latitude, location.longitude), zoom: 16);

          _controller.animateCamera(
              CameraUpdate.newCameraPosition(_currentCameraPosition));
          setState(() {
            _marker = Marker(
                markerId: MarkerId("fuck"),
                position: LatLng(location.latitude, location.longitude));
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initLocation();
        }
      }
    } catch (e) {
      print(e);
    }
  }
   Widget loadMap(){

   }

  GlobalKey<ScaffoldState> _sacaffoldkey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _sacaffoldkey,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: new Text(
          "Easy Fix",
          style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              _sacaffoldkey.currentState.openDrawer();
            }),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: _marker != null ? Set.of([_marker]) : Set(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Your Profile",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              decoration: BoxDecoration(
                color: new Color(0xff622F74),
              ),
            ),
            ListTile(
              title: Text("Your Works"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorksPage()));
              },
            ),
            ListTile(
              title: Text("Help"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpPage()));
              },
            ),
            ListTile(
              title: Text("Payment"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()));
              },
            ),
            ListTile(
              title: Text("Free Works"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FreeWorkPage()));
              },
            ),
            ListTile(
              title: Text("Setting"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
            ListTile(
              
              title: Text("Sign out",
              textAlign: TextAlign.end),
              onTap:(){
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => LoginPage() ));
              }
               ,)
          ],
        ),
      ),
    );
  }
}
