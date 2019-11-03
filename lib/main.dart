import 'package:easy_fix/signup_page.dart';
import 'package:flutter/material.dart';

// import 'package:famguard/ui/signup.dart';
void main() {
  runApp(MyApp());
  return;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new FirstlogPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}
class FirstlogPage extends StatefulWidget{
  @override
  _FirstlogPageState createState() => _FirstlogPageState();
}

class _FirstlogPageState extends State<FirstlogPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final phonefeild = TextFormField(
      keyboardType: TextInputType.number,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0 , 15.0),
        hintText: "Enter Your Mobile Number",
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(32.0))),
      );
      
      final next = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Text(
          "Next",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
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
                SizedBox(height:20.0),
                phonefeild,
                SizedBox(height: 40.0,),
                next,

              ],
            ),
          ),
        ),
        ),
    );
  }
}
