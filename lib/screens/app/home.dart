import 'package:finop/widgets/finnop_investor_detail_card.dart';
import 'package:finop/widgets/finnop_post_card.dart';
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
            //name, position, companyWebsite
            FinoppPostCard(
              companyWebsite: "www.homebase.com",
              dataSource: 'assets/videos/pitch3.mp4',
              companyName: 'Home Base',
              industry: 'Agriculture',
              equity: '17%',
              postDescription:
                  'Had an amazing time explaining the impact of our product on the african continent',
              profileImagePath: 'assets/images/finopp/jeff.jpeg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Takuma Terakubo",
              position: "CEO",
              companyWebsite: "www.leapfrogventures.com",
              companyName: 'Leapfrog Ventures',
              postDescription:
                  'Leapfrog Ventures invests in successful tech companies',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/takuma_terakubo.jpg',
              postImagePath: 'assets/images/finopp/takuma_terakubo.jpg',
            ),
            FinoppPostCard(
              name: "Yassine Oussaifi",
              position: "Managing Director",
              companyWebsite: "www.africinvest.com",
              companyName: 'AfricInvest',
              postDescription:
                  'AfricInvest invests in viable African tech companies only.',
              industry: 'Internet Business',
              postDate: '2d',
              profileImagePath: 'assets/images/finopp/yassine_oussaifi.jpg',
              postImagePath: 'assets/images/finopp/yassine_oussaifi.jpg',
            ),
            FinoppPostCard(
              companyWebsite: "www.bitpesa.com",
              equity: '8%',
              dataSource: 'assets/videos/pitch3.mp4',
              companyName: 'Bitpesa',
              industry: 'Agriculture',
              postDate: '3d',
              postDescription:
                  'At DevCongress, we talked about unique the opportunities in Africa.',
              profileImagePath: 'assets/images/finopp/josephine.jpg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Gary Vaynerchuk",
              companyName: 'Vaynermedia',
              position: "CEO",
              companyWebsite: "www.vaynermedia.com",
              postDescription:
                  'We invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              postDate: '3d',
              profileImagePath: 'assets/images/finopp/garyvee.jpeg',
              postImagePath: 'assets/images/finopp/garyvee.jpeg',
            ),
            FinoppPostCard(
              name: "Eric Osiakwan ",
              position: "CTO",
              companyWebsite: "www.chanzocapital.com",
              companyName: 'Chanzo Capital',
              postDescription:
                  'Chanzo Capital invests in young promising companies with unique market opportunities.',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/eric_osiakwan.jpg',
              postImagePath: 'assets/images/finopp/eric_osiakwan.jpg',
            ),
            FinoppPostCard(
              companyWebsite: "www.ibisucement.com",
              dataSource: 'assets/videos/pitch1.mp4',
              companyName: 'Ibisu Cement',
              equity: '19%',
              industry: 'Construction',
              postDescription: "We are giving out 18% of our company for \$25,000",
              profileImagePath: 'assets/images/finopp/profile.jpg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Keet Van",
              position: "CEO",
              companyWebsite: "www.knifecapital.com",
              companyName: 'Knife Capital',
              postDescription:
                  'At Knife Capital, we work with promising startups with extraordinary visions.',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/keet_van.jpg',
              postImagePath: 'assets/images/finopp/keet_van.jpg',
            ),
            FinoppPostCard(
              name: "Kenza Lahlou",
              position: "CEO",
              companyWebsite: "www.outlierz_ventures.com",
              companyName: 'Outlierz Ventures',
              postDescription:
                  'Outlierz Ventures has invested in 5 different startups '
                  'and we are still searching.',
              industry: 'Financial Tech',
              profileImagePath: 'assets/images/finopp/kenza_lahlou.jpg',
              postImagePath: 'assets/images/finopp/kenza_lahlou.jpg',
            ),
            FinoppPostCard(
              name: "Florian",
              position: "CFO",
              companyWebsite: "www.bamboocapital.com",
              companyName: 'Bamboo Capital',
              postDescription:
                  'Bamboo Capital Partners invests in all types of businesses esp. Agriculture sector.',
              postDate: '3d',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/florian.jpg',
              postImagePath: 'assets/images/finopp/florian.jpg',
            ),
            FinoppPostCard(
              companyWebsite: "www.andela.com",
              dataSource: 'assets/videos/pitch2.mp4',
              equity: '23%',
              companyName: 'Andela',
              industry: 'Technology',
              postDate: '4d',
              postDescription:
                  'Had fun at DevFest. We gave a talk on emerging markets in Africa.',
              profileImagePath: 'assets/images/finopp/jeff.jpeg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Mehak Malik",
              position: "CFO",
              companyWebsite: "www.beyondcapital.com",
              companyName: 'Beyond Capital',
              postDescription:
                  'At Beyond Capital, we think beyond capital by focusing more on the impact we make.',
              industry: 'Human Resources',
              postDate: '2d',
              profileImagePath: 'assets/images/finopp/mehak_malik.jpg',
              postImagePath: 'assets/images/finopp/mehak_malik.jpg',
            ),
            FinoppPostCard(
              name: "Muthoni Wachira",
              position: "CEO",
              companyWebsite: "www.ewbventures.com",
              companyName: 'EWB Ventures',
              postDescription: 'EWB Ventures invests in any viable Oil Ventures.',
              industry: 'Oil Industry',
              profileImagePath: 'assets/images/finopp/muthoni_wachira.jpg',
            ),
            FinoppPostCard(
              companyWebsite: "www.paystack.com",
              dataSource: 'assets/videos/pitch1.mp4',
              equity: '19%',
              companyName: 'Paystack',
              postDate: '2d',
              industry: 'Network',
              postDescription:
                  'At AAL Cup this December and we gave a talk on our product',
              profileImagePath: 'assets/images/finopp/profile.jpg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Novastar Ali",
              position: "Founder and CEO",
              companyWebsite: "www.cwe_invest.com",
              companyName: 'CWe Invest',
              postDescription:
                  'CWe invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              postDate: '5d',
              profileImagePath: 'assets/images/finopp/novastar.jpg',
              postImagePath: 'assets/images/finopp/novastar.jpg',
            ),
            FinoppPostCard(
              companyWebsite: "www.barehands.com",
              dataSource: 'assets/videos/pitch1.mp4',
              companyName: 'Bare Hands',
              equity: '32%',
              industry: 'Technology',
              postDescription:
                  'We attended a tech event and we gave a talk on our product',
              profileImagePath: 'assets/images/finopp/josephine.jpg',
              isInvestor: false,
            ),
            FinoppPostCard(
              name: "Satoshi Nakamoto",
              position: "CEO",
              companyWebsite: "www.ouicapital.com",
              companyName: 'Oui Capital',
              postDescription:
                  'At Oui Capital, we say oui to all promising and viable forestry startups.',
              industry: 'Forestry',
              postDate: '6d',
              profileImagePath: 'assets/images/finopp/oui_capital.jpg',
              postImagePath: 'assets/images/finopp/oui_capital.jpg',
            ),
            FinoppPostCard(
              name: "David Legend",
              position: "CTO",
              companyWebsite: "www.flutterwave.com",
              dataSource: 'assets/videos/pitch2.mp4',
              companyName: 'Flutterwave',
              industry: 'Technology',
              postDate: '7d',
              postDescription:
                  'We pitched our product to investors at World Youth Forum',
              profileImagePath: 'assets/images/finopp/profile.jpg',
              isInvestor: false,
            ),
          ],
        ),
      ),
    );
  }
}
