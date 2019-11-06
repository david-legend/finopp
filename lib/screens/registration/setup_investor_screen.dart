import 'package:flutter/material.dart';

class SetupInvestorScreen extends StatefulWidget {

  static const String ROUTE_NAME = '/setupInvestor';

  @override
  _SetupInvestorScreenState createState() => _SetupInvestorScreenState();
}

class _SetupInvestorScreenState extends State<SetupInvestorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('investor'),
      ),
    );
  }
}
