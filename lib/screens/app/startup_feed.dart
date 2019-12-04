import 'package:finop/widgets/finnop_investor_detail_card.dart';
import 'package:finop/widgets/finnop_post_card.dart';
import 'package:finop/widgets/finopp_startup_detail_card.dart';
import 'package:flutter/material.dart';

class StartUpFeed extends StatefulWidget {
  @override
  _StartUpFeedState createState() => _StartUpFeedState();
}

class _StartUpFeedState extends State<StartUpFeed> {
  bool _isFollowPressed = false;

  void followStartup() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Bare Hands',
              industry: 'Technology',
              equity: '32%',
              description: 'We attended a tech event and we gave a talk on our product',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch2.mp4',
              startUpName: 'Flutterwave',
              industry: 'Technology',
              equity: '51%',
              description: 'We pitched our product to investors at World Youth Forum',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch3.mp4',
              startUpName: 'Home Base',
              industry: 'Agriculture',
              equity: '34%',
              description: 'Had an amazing time explaining the impact of our product on the african continent',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch2.mp4',
              startUpName: 'Andela',
              industry: 'Technology',
              equity: '17%',
              description: 'Had fun at DevFest. We gave a talk on emerging markets in Africa.',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Paystack',
              industry: 'Network',
              equity: '8%',
              description: 'At AAL Cup this December and we gave a talk on our product',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch3.mp4',
              startUpName: 'Bitpesa',
              industry: 'Agriculture',
              equity: '9%',
              description: 'At DevCongress, we talked about unique the opportunities in Africa.',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Ibisu Cement',
              industry: 'Construction',
              equity: '18%',
              description: "We are giving out 18% of our company for \$25,000",
            ),
          ],
        ),
      ),
    );
  }
}
