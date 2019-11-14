import 'package:finop/widgets/finop_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:video_player/video_player.dart';

import '../../hotelAppTheme.dart';
import 'view_startup_profile.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              videoCards(),
              videoCards(),
              videoCards(),
              videoCards(),
              videoCards(),
              videoCards(),
              videoCards(),
            ],
          )
      ),
    );
  }

  Widget videoCards() {
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
                  AspectRatio(
                    aspectRatio: 2,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      child:  NetworkPlayerLifeCycle(
                        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                            (BuildContext context,
                            VideoPlayerController controller) =>
                            AspectRatioVideo(controller),
                      ),
//                      FutureBuilder(
//                        future: _initializeVideoPlayerFuture,
//                        builder: (context, snapshot) {
//                          if (snapshot.connectionState == ConnectionState.done) {
//                            // If the VideoPlayerController has finished initialization, use
//                            // the data it provides to limit the aspect ratio of the video.
//                            return AspectRatio(
//                              aspectRatio: _controller.value.aspectRatio,
//                              // Use the VideoPlayer widget to display the video.
//                              child: VideoPlayer(_controller),
//
//                            );
//                          } else {
//                            // If the VideoPlayerController is still initializing, show a
//                            // loading spinner.
//                            return Center(child: CircularProgressIndicator());
//                          }
//                        },
//                      ),
                    ),
//                    Image.asset(
//                      'assets/images/finop/finop_1.png',
//                      fit: BoxFit.cover,
//                    ),
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
                              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, ViewStartUpProfileScreen.ROUTE_NAME);
                                    },
                                    child: Text(
                                      'Faska Motors',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Technology',
                                        style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                      ),
//                                      SizedBox(
//                                        width: 4,
//                                      ),
//                                      Icon(
//                                        FontAwesomeIcons.mapMarkerAlt,
//                                        size: 12,
//                                        color: HotelAppTheme.buildLightTheme().primaryColor,
//                                      ),
//                                      Expanded(
//                                        child: Text(
//                                          "30 km to city",
//                                          overflow: TextOverflow.ellipsis,
//                                          style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
//                                        ),
//                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          rating: 4.4,
                                          size: 20,
                                          color: HotelAppTheme.buildLightTheme().primaryColor,
                                          borderColor: HotelAppTheme.buildLightTheme().primaryColor,
                                        ),
                                        Text(
                                          "80 Reviews",
                                          style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "\$180 K",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "20% equity",
                                style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                              ),
                            ],
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

