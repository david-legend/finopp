import 'package:finop/const/_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartUpProfile extends StatefulWidget {
  static const String ROUTE_NAME = '/viewStartUpProfileScreen';

  @override
  _StartUpProfileState createState() => _StartUpProfileState();
}

class _StartUpProfileState extends State<StartUpProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('David Cobbina', style: onlyFontTextStyle),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                AppImagePath.garyVee,
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Bare hands'),
                      Text('Technology'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    child: Text('blah blah blah blah'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FinoppPrimaryButton(
                        title: 'Message',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      FinoppPrimaryButton(
                        title: 'Follow',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '9K',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'UPVOTES',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                            ),
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
                            '3K',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'FOLLOWERS',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                            ),
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
                            '154',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'REVIEWS',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(AppIconsPath.globe),
                      Text('Barehands.com'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(AppIconsPath.sitemap),
                      Text('Equity'),
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
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Profile'),
                      SizedBox(height: 20.0),
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
                                          child: Text(
                                            'Participated in Tech Crunch',
                                            softWrap: true,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'We show cased the potential of using finnop.',
                                            softWrap: true,
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
                                        Text('Participated in Tech Crunch'),
                                        Text(
                                          'We show cased the potential of using finnop.',
                                          softWrap: true,
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
