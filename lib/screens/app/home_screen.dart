import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to the home Screen'),
      ),
    );
  }
}
