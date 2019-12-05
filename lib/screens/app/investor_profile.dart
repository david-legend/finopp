import 'package:finop/const/_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvestorProfile extends StatefulWidget {
  static const String ROUTE_NAME = '/viewInvestorProfileScreen';

  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFINOP_PRIMARY,
        elevation: 0.0,
        title: Text('Gary Vee', style: onlyFontTextStyle),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Container(
                height: 300.0,
                color: kFINOP_PRIMARY,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 80,
                      minRadius: 70,
                      backgroundImage: AssetImage(AppImagePath.garyVee
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text('Gary Vee', style: whiteProfileTextStyle,),
                    SizedBox(height: 20.0),
                    Text('CEO of Vaynermedia', style: mediumWhiteTextStyle,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Bare hands',
                        style: profileTextStyle,
                      ),
                      Text(
                        'Technology',
                        style: smallTextWithSecondaryColorStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur '
                          'adipiscing elit, sed do eiusmod tempor incididunt ut '
                          'labore et dolore magna aliqua.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FinoppPrimaryButton(
                        title: 'Message',
                        buttonIcon: Icons.message,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      FinoppPrimaryButton(
                        color: Colors.white,
                        title: 'Follow',
                        width: MediaQuery.of(context).size.width / 3,
                        buttonIcon: Icons.add,
                        buttonIconColor: kFINOP_DARK_SHADE,
                        buttonTextStyle: lightButtonWithDarkTextStyle,
                        borderWidth: 1.0,
                        borderColor: kFINOP_DARK_SHADE,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '30',
                            style: mediumDarkerTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Posts',
                            style: normalDarkerTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '200',
                            style: mediumDarkerTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text('FOLLOWERS', style: normalDarkerTextStyle),
                        ],
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '200',
                            style: mediumDarkerTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Upvote',
                            style: normalDarkerTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    decoration: BoxDecoration(
                      color: kFINOP_LIGHT,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(AppIconsPath.globe),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Barehands.com',
                            style: belowMediumDarkerTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    decoration: BoxDecoration(
                      color: kFINOP_LIGHT,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(AppIconsPath.sitemap),
                          SizedBox(
                              width: 25.0
                          ),
                          Text('Equity', style: belowMediumDarkerTextStyle,),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kFINOP_PRIMARY,
                              borderRadius:
                              new BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4.0),
                              child: Text(
                                '34%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Profile', style: belowMediumDarkerTextStyle,),
                      SizedBox(height: 10.0),
                      Card(
                        elevation: 4.0,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    AppImagePath.garyVee,
                                    width: 80,
                                    height: 80,
                                  ),
                                  SizedBox(width: 15.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5.0),
                                          child: Text(
                                            'Participated in Tech Crunch',
                                            style: belowMediumDarkerTextStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'We show cased the potential of using finnop.',
                                            style: normalDarkerTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    AppImagePath.garyVee,
                                    width: 80,
                                    height: 80,
                                  ),
                                  SizedBox(width: 15.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5.0),
                                          child: Text(
                                            'Participated in Tech Crunch',
                                            style: belowMediumDarkerTextStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'We show cased the potential of using finnop.',
                                            style: normalDarkerTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
