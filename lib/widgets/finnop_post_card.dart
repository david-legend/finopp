import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/screens/app/investor_profile.dart';
import 'package:finop/screens/app/startup_profile.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import 'finop_video_player.dart';

class FinoppPostCard extends StatefulWidget {
  final VideoPlayerController controller;
  final String dataSource;
  final String profileImagePath;
  final String postImagePath;
  final String companyName;
  final String name;
  final String position;
  final String companyWebsite;
  final String industry;
  final String postDate;
  final String postDescription;
  final IconData likeIconData;
  final IconData commentIconData;
  final IconData shareIconData;
  final String searchHintText;
  final String notificationCount;
  final Color searchBoxBackgroundColor;
  final Color notificationBackgroundColor;
  final double bulletWidth;
  final double bulletHeight;
  final Color bulletColor;
  final BoxShape bulletShape;
  final bool isInvestor;
  final String equity;

  FinoppPostCard({
    this.controller,
    this.dataSource = 'assets/videos/pitch1.mp4',
    this.profileImagePath = AppImagePath.accountProfilePhoto,
    this.postImagePath = AppImagePath.accountProfilePhoto,
    this.companyName = 'Fedds Group of Company',
    this.name = 'Gary Vee',
    this.position = 'CEO',
    this.companyWebsite = 'www.gmx.com',
    this.industry = 'Technology',
    this.postDate = '1d',
    this.postDescription =
        'We attended a tech event and we gave a talk on our product',
    this.likeIconData = FontAwesomeIcons.thumbsUp,
    this.commentIconData = FontAwesomeIcons.comments,
    this.shareIconData = FontAwesomeIcons.shareAlt,
    this.searchHintText = "Search for startups or investors",
    this.notificationCount = '4',
    this.searchBoxBackgroundColor = kFINOP_SEARCH_BAR_BG,
    this.notificationBackgroundColor = kFINOP_SECONDARY,
    this.bulletColor = kFINOP_PRIMARY,
    this.bulletShape = BoxShape.circle,
    this.bulletHeight = 4.0,
    this.bulletWidth = 4.0,
    this.isInvestor = true,
    this.equity = '12%',
  });

  @override
  _FinoppPostCardState createState() => _FinoppPostCardState();
}

class _FinoppPostCardState extends State<FinoppPostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400.0,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 24.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () => navigateToUserProfile(),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.profileImagePath),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () => navigateToUserProfile(),
                        child: Text(
                          widget.companyName,
                          style: boldTextWithBlack,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          bullet(
                            width: widget.bulletWidth,
                            height: widget.bulletHeight,
                            color: widget.bulletColor,
                            shape: widget.bulletShape,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.industry,
                            style: smallGreyText,
                          ),
                          SizedBox(width: 10.0),
                          bullet(
                            width: widget.bulletWidth,
                            height: widget.bulletHeight,
                            color: widget.bulletColor,
                            shape: widget.bulletShape,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            widget.postDate,
                            style: smallGreyText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.0, top: 16.0, right: 32.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(widget.postDescription)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: widget.isInvestor
                        ? Image.asset(
                            widget.postImagePath,
                            width: MediaQuery.of(context).size.width - 40.0,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width - 40.0,
                            height: 200.0,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // If the video is playing, pause it.
                                  if (widget.controller.value.isPlaying) {
                                    widget.controller.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    widget.controller.play();
                                  }
                                });
                              },
                              child: AssetPlayerLifeCycle(
                                widget.dataSource,
                                (BuildContext context,
                                        VideoPlayerController controller) =>
                                    AspectRatioVideo(controller),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Row(
                children: <Widget>[
                  customIconText(icon: widget.likeIconData, iconText: "Like"),
                  customIconText(
                      icon: widget.commentIconData, iconText: "Comment"),
                  customIconText(icon: widget.shareIconData, iconText: "Share"),
//                FinoppPrimaryButton(title: "Follow", width: MediaQuery.of(context).size.width / 8,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customIconText({IconData icon, String iconText}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: Icon(
              icon,
              size: 16,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          Text(
            iconText,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget bullet({double width, double height, Color color, BoxShape shape}) {
    return new Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
    );
  }

  void navigateToUserProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            widget.isInvestor ? InvestorProfile() : StartUpProfile(),
        settings: RouteSettings(
          arguments: ScreenArguments(
            name: widget.name,
            position: widget.position,
//            logo: logo,
            companyName: widget.companyName,
            industry: widget.industry,
            companyWebsite: widget.companyWebsite,
            imageUrl: widget.profileImagePath,
            postDescription: widget.postDescription,
            postImagePath: widget.postImagePath,
            equity: widget.equity,
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  String name;
  String companyName;
  String industry;
  String logo;
  String position;
  String companyWebsite;
  String imageUrl;
  String postDescription;
  String postImagePath;
  String equity;

  ScreenArguments({
    this.name = '',
    this.companyName = '',
    this.logo = '',
    this.industry = '',
    this.position = '',
    this.imageUrl = '',
    this.companyWebsite = '',
    this.postDescription = '',
    this.postImagePath = '',
    this.equity = '',
  });
}
