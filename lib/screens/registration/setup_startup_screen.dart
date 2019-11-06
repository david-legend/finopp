import 'package:flutter/material.dart';

class SetupStartUpScreen extends StatefulWidget {

  static const String ROUTE_NAME = '/setupStartUp';

  @override
  _SetupStartUpScreenState createState() => _SetupStartUpScreenState();
}

class _SetupStartUpScreenState extends State<SetupStartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('start up'),
      ),
    );
  }
}
