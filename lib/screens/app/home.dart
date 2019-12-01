import 'package:finop/widgets/finnop_investor_detail_card.dart';
import 'package:finop/widgets/finopp_startup_detail_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch3.mp4',
              startUpName: 'Home Base',
              industry: 'Agriculture',
              equity: '34%',
              description: 'Had an amazing time explaining the impact of our product on the african continent',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Takuma Terakubo',
              description: 'Leapfrog Ventures invests in successful tech companies',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/takuma_terakubo.jpg',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Yassine Oussaifi',
              description: 'AfricInvest invests in viable African tech companies only.',
              industry: 'Internet Business',
              profileImagePath: 'assets/images/finopp/yassine_oussaifi.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch3.mp4',
              startUpName: 'Bitpesa',
              industry: 'Agriculture',
              equity: '9%',
              description: 'At DevCongress, we talked about unique the opportunities in Africa.',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Gary Vaynerchuk',
              description: 'We invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              profileImagePath: 'assets/images/finopp/garyvee.jpeg',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Eric Osiakwan',
              description: 'Chanzo Capital invests in young promising companies with unique market opportunities.',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/eric_osiakwan.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Ibisu Cement',
              industry: 'Construction',
              equity: '18%',
              description: "We are giving out 18% of our company for \$25,000",
            ),
            FinoppInvestorDetailCard(
              investorName: 'Keet van Zyl',
              description: 'At Knife Capital, we work with promising startups with extraordinary visions.',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/keet_van.jpg',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Kenza Lahlou',
              description: 'Outlierz Ventures has invested in 5 different startups '
                  'and we are still searching.',
              industry: 'Financial Tech',
              profileImagePath: 'assets/images/finopp/kenza_lahlou.jpg',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Florian Kemmerich',
              description: 'Bamboo Capital Partners invests in all types of businesses esp. Agriculture sector.',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/florian.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch2.mp4',
              startUpName: 'Andela',
              industry: 'Technology',
              equity: '17%',
              description: 'Had fun at DevFest. We gave a talk on emerging markets in Africa.',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Mehak Malik',
              description: 'At Beyond Capital, we think beyond capital by focusing more on the impact we make.',
              industry: 'Human Resources',
              profileImagePath: 'assets/images/finopp/mehak_malik.jpg',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Muthoni Wachira,',
              description: 'EWB Ventures invests in any viable Oil Ventures.',
              industry: 'Oil Industry',
              profileImagePath: 'assets/images/finopp/muthoni_wachira.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Paystack',
              industry: 'Network',
              equity: '8%',
              description: 'At AAL Cup this December and we gave a talk on our product',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Dotun Olowoporoku',
              description: 'CWe invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              profileImagePath: 'assets/images/finopp/novastar.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch1.mp4',
              startUpName: 'Bare Hands',
              industry: 'Technology',
              equity: '32%',
              description: 'We attended a tech event and we gave a talk on our product',
            ),
            FinoppInvestorDetailCard(
              investorName: 'Oluwaseun Oyinsan',
              description: 'At Oui Capital, we oui to all promising and viable forestry startups.',
              industry: 'Forestry',
              profileImagePath: 'assets/images/finopp/oui_capital.jpg',
            ),
            FinoppStartUpDetailCard(
              dataSource: 'assets/videos/pitch2.mp4',
              startUpName: 'Flutterwave',
              industry: 'Technology',
              equity: '51%',
              description: 'We pitched our product to investors at World Youth Forum',
            ),

          ],
        ),
      ),
    );
  }
}
