import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String imagePath;
  final IconData iconData;
  final String searchHintText;
  final String notificationCount;
  final Color searchBoxBackgroundColor;
  final Color notificationBackgroundColor;

  CustomAppBar({
    this.imagePath = AppImagePath.accountProfilePhoto,
    this.iconData = Icons.chat,
    this.searchHintText = "Search for startups or investors",
    this.notificationCount = '4',
    this.searchBoxBackgroundColor = kFINOP_SEARCH_BAR_BG,
    this.notificationBackgroundColor = kFINOP_SECONDARY,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(widget.imagePath),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 25.0,
                  top: 12.0,
                  bottom: 12.0,
                  right: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(
                    width: 0.0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: widget.searchHintText,
                fillColor: widget.searchBoxBackgroundColor,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(widget.iconData), onPressed: () {},),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: widget.notificationBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    widget.notificationCount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
