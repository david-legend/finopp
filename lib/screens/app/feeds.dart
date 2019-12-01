import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/widgets/finnop_investor_detail_card.dart';
import 'package:finop/widgets/finnop_post_card.dart';
import 'package:finop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            FinoppInvestorDetailCard(),
            FinoppPostCard(),
            FinoppPostCard(),
            FinoppPostCard(),
          ],
        ),
      ),
    );
  }
}
