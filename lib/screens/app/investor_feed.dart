import 'package:finop/widgets/finnop_investor_detail_card.dart';
import 'package:finop/widgets/finnop_post_card.dart';
import 'package:finop/widgets/finopp_startup_detail_card.dart';
import 'package:flutter/material.dart';

class InvestorFeed extends StatefulWidget {
  @override
  _InvestorFeedState createState() => _InvestorFeedState();
}

class _InvestorFeedState extends State<InvestorFeed> {
//  name: widget.investorName,
//  position: widget.position,
//  companyName: widget.companyName,
//  industry: widget.industry,
//  companyWebsite: widget.companyWebsite,
//  imageUrl: widget.profileImagePath,
//  postDescription: widget.description,
//  postImagePath: widget.profileImagePath
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: ListView(
          children: <Widget>[
            FinoppInvestorDetailCard(
              position: 'CEO',
              companyName: 'Vaynermedia',
              companyWebsite: 'www.vaynermedia.com',
              investorName: 'Gary Vaynerchuk',
              description:
                  'We invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              profileImagePath: 'assets/images/finopp/garyvee.jpeg',
            ),
            FinoppInvestorDetailCard(
              position: 'CEO',
              companyName: 'Chanzo Capital',
              companyWebsite: 'www.chanzocapital.com',
              investorName: 'Eric Osiakwan',
              description:
                  'Chanzo Capital invests in young promising companies with unique market opportunities.',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/eric_osiakwan.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CTO',
              companyName: 'Knife Capital',
              companyWebsite: 'www.knifecapital.com',
              investorName: 'Keet van Zyl',
              description:
                  'At Knife Capital, we work with promising startups with extraordinary visions.',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/keet_van.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CFO',
              companyName: 'Outlierz Ventures',
              companyWebsite: 'www.outlierz_ventures.com',
              investorName: 'Kenza Lahlou',
              description:
                  'Outlierz Ventures has invested in 5 different startups '
                  'and we are still searching.',
              industry: 'Financial Tech',
              profileImagePath: 'assets/images/finopp/kenza_lahlou.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CFO',
              companyName: 'Bamboo Capital',
              companyWebsite: 'www.bamboocapital.com',
              investorName: 'Florian Kemmerich',
              description:
                  'Bamboo Capital Partners invests in all types of businesses esp. Agriculture sector.',
              industry: 'Agriculture',
              profileImagePath: 'assets/images/finopp/florian.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'MD',
              companyName: 'Beyond Capital',
              companyWebsite: 'www.beyondcapital.com',
              investorName: 'Mehak Malik',
              description:
                  'At Beyond Capital, we think beyond capital by focusing more on the impact we make.',
              industry: 'Human Resources',
              profileImagePath: 'assets/images/finopp/mehak_malik.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CTO',
              companyName: 'EWB Ventures',
              companyWebsite: 'www.ewb_ventures.com',
              investorName: 'Muthoni Wachira,',
              description: 'EWB Ventures invests in any viable Oil Ventures.',
              industry: 'Oil Industry',
              profileImagePath: 'assets/images/finopp/muthoni_wachira.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CEO',
              companyName: 'CWe',
              companyWebsite: 'www.cwe_invest.com',
              investorName: 'Dotun Olowoporoku',
              description:
                  'CWe invest in viable, promising communications and branding startups.',
              industry: 'Communications',
              profileImagePath: 'assets/images/finopp/novastar.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CFO',
              companyName: 'Oui Capital',
              companyWebsite: 'www.ouicapital.com',
              investorName: 'Oluwaseun Oyinsan',
              description:
                  'At Oui Capital, we oui to all promising and viable forestry startups.',
              industry: 'Forestry',
              profileImagePath: 'assets/images/finopp/oui_capital.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'CEO',
              companyName: 'LeapFrog Ventures',
              companyWebsite: 'www.leapfrog_ventures.com',
              investorName: 'Takuma Terakubo',
              description:
                  'Leapfrog Ventures invests in successful tech companies',
              industry: 'Technology',
              profileImagePath: 'assets/images/finopp/takuma_terakubo.jpg',
            ),
            FinoppInvestorDetailCard(
              position: 'MD',
              companyName: 'AfricInvest',
              companyWebsite: 'www.africinvest.com',
              investorName: 'Yassine Oussaifi',
              description:
                  'AfricInvest invests in viable African tech companies only.',
              industry: 'Internet Business',
              profileImagePath: 'assets/images/finopp/yassine_oussaifi.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
