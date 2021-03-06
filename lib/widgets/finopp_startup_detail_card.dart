import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/models/screen_arguments.dart';
import 'package:finop/screens/app/investor_profile.dart';
import 'package:finop/screens/app/startup_profile.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'finop_video_player.dart';

class FinoppStartUpDetailCard extends StatefulWidget {
  final VideoPlayerController controller;
  final String profileImagePath;
  final String startUpName;
  final String dataSource;
  final String equity;
  final String industry;
  final String postDescription;
  final String buttonTitle;
  final Function action;
  final bool followPressed;

  final String name;
  final String companyWebsite;
  final String position;

  FinoppStartUpDetailCard({
    this.controller,
    this.profileImagePath = AppImagePath.accountProfilePhoto,
    this.startUpName = 'Bare Hand',
    this.dataSource = 'assets/videos/pitch1.mp4',
    this.equity = '18%',
    this.industry = 'Technology',
    this.postDescription =
        'We attended a tech event and we gave a talk on our product',
    this.buttonTitle = "Follow",
    this.action,
    this.followPressed = false,
    this.name = '',
    this.companyWebsite = '',
    this.position = '',
  });

  @override
  _FinoppStartUpDetailCardState createState() =>
      _FinoppStartUpDetailCardState();
}

class _FinoppStartUpDetailCardState extends State<FinoppStartUpDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 400.0,
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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
                  (BuildContext context, VideoPlayerController controller) =>
                      AspectRatioVideo(controller),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => navigateToUserProfile(),
                    child: Text(
                      widget.startUpName,
                      style: cardHeadingStyle,
                    ),
                  ),
                  Text('${widget.equity} Equity', style: mediumGreyText)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
              child: Text(
                widget.industry,
                style: smallTextWithSecondaryColorStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Text(
                widget.postDescription,
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  widget.followPressed
                      ? FinoppPrimaryButton(
                          title: widget.buttonTitle,
                          width: MediaQuery.of(context).size.width / 5,
                          buttonPadding: 0.0,
                          action: widget.action(),
                        )
                      : FinoppPrimaryButton(
                          title: widget.buttonTitle,
                          borderWidth: 1.0,
                          color: Colors.white,
                          buttonTextStyle: lightButtonStyle,
                          width: MediaQuery.of(context).size.width / 5,
                          buttonPadding: 0.0,
                          action: widget.action,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToUserProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StartUpProfile(),
        settings: RouteSettings(
          arguments: ScreenArguments(
            companyName: widget.startUpName,
            industry: widget.industry,
            companyWebsite: widget.companyWebsite,
            imageUrl: widget.profileImagePath,
            postDescription: widget.postDescription,
            postImagePath: widget.profileImagePath,
            equity: widget.equity,
          ),
        ),
      ),
    );
  }
}
