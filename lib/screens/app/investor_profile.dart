import 'package:finop/const/_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/widgets/finnop_post_card.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat_screen.dart';

class InvestorProfile extends StatefulWidget {
  static const String ROUTE_NAME = '/viewInvestorProfileScreen';

  @override
  _InvestorProfileState createState() => _InvestorProfileState();
}

class _InvestorProfileState extends State<InvestorProfile> {
  ScreenArguments args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFINOP_PRIMARY,
        elevation: 0.0,
        title: Text(args.companyName, style: onlyFontTextStyle),
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
                      backgroundImage: AssetImage(
                        args.imageUrl,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      args.name,
                      style: whiteProfileTextStyle,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'CEO of ${args.companyName}',
                      style: mediumWhiteTextStyle,
                    ),
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
                        args.companyName,
                        style: profileTextStyle,
                      ),
                      Text(
                        args.industry,
                        style: smallTextWithSecondaryColorStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    child: Text(
                      '${args.companyName} invests in viable and promising ${args.industry} startups',
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
                        action: message,
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
                            args.companyWebsite,
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
                      margin: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(AppIconsPath.chartLine),
                          SizedBox(width: 25.0),
                          Text(
                            'Expert Investor',
                            style: belowMediumDarkerTextStyle,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Profile',
                        style: belowMediumDarkerTextStyle,
                      ),
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
                                    args.imageUrl,
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
                                            'Evaluated new startups at the RiseUp Summit',
                                            style: belowMediumDarkerTextStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            args.postDescription,
                                            style: normalDarkerTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    args.imageUrl,
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
                                            'Met other investors at the World Youth Forum',
                                            style: belowMediumDarkerTextStyle,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            args.postDescription,
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

  message() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => ChatScreen(
        name: args.companyName,
        profileImage: args.imageUrl,
      ),
    );
    Navigator.of(context).push(route);
  }
}
