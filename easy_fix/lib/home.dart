import 'package:flutter/material.dart';
import 'package:easy_fix/freeworks.dart';
import 'package:easy_fix/help.dart';
import 'package:easy_fix/payment.dart';
import 'package:easy_fix/setting.dart';
import 'package:easy_fix/yourworks.dart';
class HomePage extends StatefulWidget{
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  GlobalKey<ScaffoldState> _sacaffoldkey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
  
    return new Scaffold(
      key: _sacaffoldkey,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: new Text("Easy Fix",style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(icon: Icon(Icons.menu),color: Colors.black, onPressed: (){
          _sacaffoldkey.currentState.openDrawer();
        }
        ),
        
      ),

      drawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Your Profile",
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
              onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => WorksPage()));
              },
            ),
            ListTile(
              title: Text("Help"),
              onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => HelpPage()));
              },
            ),
            ListTile(
              title: Text("Payment"),
              onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaymentPage()));
              },
            ),
            ListTile(title: Text("Free Works"),
            onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => FreeWorkPage()));
              },
            ),
            ListTile(
              title: Text("Setting"),
              onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
          ],
          ) ,
          ),
      );
  }
}