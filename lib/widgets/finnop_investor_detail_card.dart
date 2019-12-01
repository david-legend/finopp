import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';

class FinoppInvestorDetailCard extends StatefulWidget {
  final String profileImagePath;
  final String investorName;
  final String industry;
  final String description;
  final String buttonTitle;
  final bool followPressed;

  FinoppInvestorDetailCard({
    this.profileImagePath = AppImagePath.accountProfilePhoto,
    this.investorName = 'Fedds Group of Company',
    this.industry = 'Technology',
    this.description =
        'We attended a tech event and we gave a talk on our product',
    this.buttonTitle = "Follow",
    this.followPressed = false,
  });

  @override
  _FinoppInvestorDetailCardState createState() => _FinoppInvestorDetailCardState();
}

class _FinoppInvestorDetailCardState extends State<FinoppInvestorDetailCard> {
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
            Image.asset(
              widget.profileImagePath,
              width: MediaQuery.of(context).size.width - 40.0,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
              child: Text(widget.investorName, style: cardHeadingStyle),
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
              child: Text(widget.description),
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
                        )
                      : FinoppPrimaryButton(
                          title: widget.buttonTitle,
                          borderWidth: 1.0,
                          color: Colors.white,
                          buttonTextStyle: lightButtonStyle,
                          width: MediaQuery.of(context).size.width / 5,
                          buttonPadding: 0.0,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
