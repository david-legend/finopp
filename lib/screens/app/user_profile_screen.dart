import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

import 'chat_screen.dart';

class UserProfileScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/userProfileScreen';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/finop/david.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'CYST',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Technology',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Toast.show('not implemented yet!', context);
                      },
                      icon: Icon(Icons.menu),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
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
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Text(
                  'CYST is a software innovation company which believes strongly '
                      'in challenging conventions. Cystians are passionate people '
                      'who care about solving our everyday problems using technology. '
                      'Everything we do is value-centered and geared towards the '
                      'redefining of the African stereotype.',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Goal:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '\$500,000',
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Equity:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '20%',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Toast.show('not implemented yet', context,
                          duration: 3, gravity: Toast.BOTTOM);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.globe,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'teamcyst.com',
                        ),
                        SizedBox(width: 20.0),
                        Icon(
                          FontAwesomeIcons.home,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Est. 2017',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Toast.show('not implemented yet!', context);
                        },
                        color: Colors.white,
                        child: Text('Create a fundraiser'),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.grey[400])),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0),
              Divider(
                height: 0,
                thickness: 2,
                color: Colors.grey[300],
              ),
              SizedBox(height: 8.0),
              Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  gallery(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gallery() {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/finop/logo2.jpeg',
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
