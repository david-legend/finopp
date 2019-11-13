import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:video_player/video_player.dart';

import '../../hotelAppTheme.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  VoidCallback listener;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    listener = () {
      setState(() {});
    };
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

  void createVideo() {
    if (_controller == null) {
      _controller = VideoPlayerController.network(
          "https://r3---sn-vgqsknez.googlevideo.com/videoplayback?source=youtube&mime=video%2Fmp4&itag=22&key=cms1&requiressl=yes&beids=%5B9466592%5D&ratebypass=yes&fexp=9466586,23724337&ei=g3jiWvfCL4O_8wScopaICA&signature=43C209DD37289D74DB39A9BBF7BC442EAC049426.14B818F50F4FA686C13AF5DD1C2A498A9D64ECC9&fvip=3&pl=16&sparams=dur,ei,expire,id,initcwndbps,ip,ipbits,ipbypass,itag,lmt,mime,mip,mm,mn,ms,mv,pl,ratebypass,requiressl,source&ip=54.163.50.118&lmt=1524616041346022&expire=1524813027&ipbits=0&dur=1324.768&id=o-AJvotKVxbyFDCz5LQ1HWQ8TvNoHXWb2-86a_50k3EV0f&rm=sn-p5qyz7s&req_id=e462183e4575a3ee&ipbypass=yes&mip=96.244.254.218&redirect_counter=2&cm2rm=sn-p5qe7l7s&cms_redirect=yes&mm=34&mn=sn-vgqsknez&ms=ltu&mt=1524791367&mv=m")
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.initialize();
        _controller.play();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              pictureCards(),
              pictureCards(),
              pictureCards(),
              pictureCards(),
              pictureCards(),
              pictureCards(),
              pictureCards(),
            ],
          )
      ),
    );
  }

  Widget pictureCards() {
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
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            // If the VideoPlayerController has finished initialization, use
                            // the data it provides to limit the aspect ratio of the video.
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              // Use the VideoPlayer widget to display the video.
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            // If the VideoPlayerController is still initializing, show a
                            // loading spinner.
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
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
                                  Text(
                                    'Faska Motors',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
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

  Widget videoCards(){}
}

