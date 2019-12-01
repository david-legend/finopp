import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinoppPostCard extends StatefulWidget {
  final String profileImagePath;
  final String postImagePath;
  final String companyName;
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

  FinoppPostCard({
    this.profileImagePath = AppImagePath.accountProfilePhoto,
    this.postImagePath = AppImagePath.accountProfilePhoto,
    this.companyName = 'Fedds Group of Company',
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
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.profileImagePath),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.companyName, style: boldTextWithBlack),
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
                            style: verySmallText,
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
                            style: verySmallText,
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
                    child: Image.asset(
                      widget.postImagePath,
                      width: MediaQuery.of(context).size.width - 40.0,
                      height: 200,
                      fit: BoxFit.cover,
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
}
