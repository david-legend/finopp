import 'package:finop/screens/app/investor_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../hotelAppTheme.dart';
import 'view_startup_profile.dart';

class ScreenArguments {
  String name;
  String companyName;
  String industry;
  String logo;
  String position;
  String companyWebsite;
  String dateEstablished;
  String imageUrl;

  ScreenArguments({
    this.name = '',
    this.companyName = '',
    this.logo = '',
    this.industry = '',
    this.position = '',
    this.imageUrl = '',
    this.companyWebsite = '',
    this.dateEstablished = '',
  });
}

class InvestorFeedScreen extends StatefulWidget {
  @override
  _InvestorFeedScreenState createState() => _InvestorFeedScreenState();
}

class _InvestorFeedScreenState extends State<InvestorFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          pictureCards(
              name: 'Gary Vaynerchuk',
              position: 'CEO of VaynerMedia',
              industry: 'Communications',
              logo: 'logo1',
              companyName: 'VaynerMedia',
              companyWebsite: 'vaynermedia.com',
              imageUrl: 'assets/images/finop/garyvee.jpeg',
              dateEstablished: '1998',
              numberOfReviews: '9000',
              rating: 5.0),
          pictureCards(
              name: 'Eric Osiakwan',
              position: 'CEO of Chanzo Capital',
              industry: 'Technology',
              logo: 'logo3',
              companyName: 'Chanzo Capital',
              companyWebsite: 'chanzocapital.com',
              imageUrl: 'assets/images/finop/eric_osiakwan.jpg',
              dateEstablished: '1990',
              numberOfReviews: '688',
              rating: 1.9),
          pictureCards(
              name: 'Keet van Zyl',
              position: 'CEO of Knife Capital',
              industry: 'Agriculture',
              logo: 'logo1',
              companyName: 'Knife Capital',
              companyWebsite: 'knifecapital.com',
              imageUrl: 'assets/images/finop/keet_van.jpg',
              dateEstablished: '2006',
              numberOfReviews: '689',
              rating: 4.8),
          pictureCards(
              name: 'Kenza Lahlou',
              position: 'CEO of Outlierz Ventures',
              industry: 'Financial Tech',
              logo: 'logo2',
              companyName: 'Outlierz Ventures',
              companyWebsite: 'outlierzventures.com',
              imageUrl: 'assets/images/finop/kenza_lahlou.jpg',
              dateEstablished: '2004',
              numberOfReviews: '674',
              rating: 4.9),
          pictureCards(
              name: 'Florian Kemmerich',
              position: 'CEO of Bamboo Capital Partners',
              industry: 'Agriculture',
              logo: 'logo4',
              companyName: 'Bamboo Capital Partners',
              companyWebsite: 'bamboocapital.com',
              imageUrl: 'assets/images/finop/florian.jpg',
              dateEstablished: '2009',
              numberOfReviews: '390',
              rating: 5.0),
          pictureCards(
              name: 'Mehak Malik',
              position: 'CEO of Beyond Capital',
              industry: 'Human Resources',
              companyName: 'Beyond Capital',
              companyWebsite: 'beyondcapital.com',
              imageUrl: 'assets/images/finop/mehak_malik.jpg',
              dateEstablished: '2001',
              numberOfReviews: '680',
              rating: 1.4),
          pictureCards(
              name: 'Muthoni Wachira,',
              position: 'CEO of EWB Ventures',
              industry: 'Oil Industry',
              logo: 'logo5',
              companyName: 'EWB Ventures',
              companyWebsite: 'ewbventures.com',
              imageUrl: 'assets/images/finop/muthoni_wachira.jpg',
              dateEstablished: '2002',
              numberOfReviews: '2002',
              rating: 5.0),
          pictureCards(
              name: 'Dotun Olowoporoku',
              position: 'CEO of Novastar Ventures',
              industry: 'Communications',
              logo: 'logo4',
              companyName: 'Novastar Ventures',
              companyWebsite: 'novastarventures.com',
              imageUrl: 'assets/images/finop/novastar.jpg',
              dateEstablished: '2011',
              numberOfReviews: '168',
              rating: 3.9),
          pictureCards(
              name: 'Oluwaseun Oyinsan',
              position: 'CEO of Oui Capital',
              industry: 'Forestry',
              logo: 'logo1',
              companyName: 'Oui Capital',
              companyWebsite: 'ouicapital.com',
              imageUrl: 'assets/images/finop/oui_capital.jpg',
              dateEstablished: '2014',
              numberOfReviews: '135',
              rating: 3.0),
          pictureCards(
              name: 'Takuma Terakubo',
              position: 'CEO of Leapfrog Ventures',
              industry: 'Technology',
              logo: 'logo6',
              companyName: 'Leapfrog Ventures',
              companyWebsite: 'leapfrogventures.com',
              imageUrl: 'assets/images/finop/takuma_terakubo.jpg',
              dateEstablished: '2016',
              numberOfReviews: '68',
              rating: 1),
          pictureCards(
              name: 'Yassine Oussaifi',
              position: 'CEO of AfricInvest',
              industry: 'Internet Business',
              logo: 'logo6',
              companyName: 'AfricInvest',
              companyWebsite: 'africinvest.com',
              imageUrl: 'assets/images/finop/yassine_oussaifi.jpg',
              dateEstablished: '2010',
              numberOfReviews: '300',
              rating: 1.4),
        ],
      )),
    );
  }

  Widget pictureCards(
      {String name,
      String companyName,
      String position,
      String companyWebsite,
      String imageUrl,
      String logo,
      String dateEstablished,
      String industry,
      String numberOfReviews,
      double rating}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: Offset(4, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvestorProfileScreen(),
                          settings: RouteSettings(
                            arguments: ScreenArguments(
                              name: name,
                              position: position,
                              logo: logo,
                              companyName: companyName,
                              industry: industry,
                              companyWebsite: companyWebsite,
                              imageUrl: imageUrl,
                              dateEstablished: dateEstablished,
                            ),
                          ),
                        ),
                      );
                    },
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: HotelAppTheme.buildLightTheme().backgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InvestorProfileScreen(),
                                          settings: RouteSettings(
                                            arguments: ScreenArguments(
                                              name: name,
                                              position: position,
                                              logo: logo,
                                              companyName: companyName,
                                              industry: industry,
                                              companyWebsite: companyWebsite,
                                              imageUrl: imageUrl,
                                              dateEstablished: dateEstablished,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        industry,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.grey.withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          rating: rating,
                                          size: 20,
                                          color: HotelAppTheme.buildLightTheme()
                                              .primaryColor,
                                          borderColor:
                                              HotelAppTheme.buildLightTheme()
                                                  .primaryColor,
                                        ),
                                        Text(
                                          "$numberOfReviews Reviews",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: HotelAppTheme.buildLightTheme().primaryColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
