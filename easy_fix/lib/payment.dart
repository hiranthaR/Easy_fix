import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget{
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Payment",
        style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}