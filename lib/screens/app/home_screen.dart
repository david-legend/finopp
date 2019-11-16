import 'package:finop/widgets/finop_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:video_player/video_player.dart';

import '../../hotelAppTheme.dart';
import 'view_startup_profile.dart';

class StartUpArguments {
  String name;
  String companyName;
  String industry;
  String goal;
  String equity;
  String companyWebsite;
  String dateEstablished;
  String imageUrl;

  StartUpArguments(
      {this.name = '',
        this.companyName = '',
        this.industry,
        this.goal = '',
        this.equity = '',
        this.imageUrl = '',
        this.companyWebsite = '',
        this.dateEstablished = ''});
}

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
          videoCards(
            dataSource: 'assets/videos/pitch1.mp4',
            startUpName: 'Bare Hands',
            industry: 'Technology',
            companyWebsite: 'barehands.com',
            imageUrl: 'assets/images/finop/logo1.jpeg',
            rating: 4.6,
            numberOfReviews: '415',
            goal: '32K',
            equity: '32%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch2.mp4',
            startUpName: 'Home Base',
            companyWebsite: 'homebase.com',
            imageUrl: 'assets/images/finop/logo2.jpeg',
            industry: 'Agriculture',
            rating: 5.0,
            numberOfReviews: '387',
            goal: '100K',
            equity: '51%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch3.mp4',
            startUpName: 'Andela',
            companyWebsite: 'andela.com',
            imageUrl: 'assets/images/finop/logo3.jpeg',
            industry: 'Technology',
            rating: 3.5,
            numberOfReviews: '21',
            goal: '46K',
            equity: '34%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch2.mp4',
            startUpName: 'Paystack',
            companyWebsite: 'paystack.com',
            imageUrl: 'assets/images/finop/logo4.jpeg',
            industry: 'Network',
            rating: 3.0,
            numberOfReviews: '81',
            goal: '\$78K',
            equity: '17%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch1.mp4',
            startUpName: 'Flutterwave',
            companyWebsite: 'flutterwave.com',
            imageUrl: 'assets/images/finop/logo5.jpeg',
            industry: 'Technology',
            rating: 2.0,
            numberOfReviews: '66',
            goal: '\$12K',
            equity: '8%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch3.mp4',
            startUpName: 'Bitpesa',
            companyWebsite: 'bitpesa.com',
            imageUrl: 'assets/images/finop/logo6.jpeg',
            industry: 'Agriculture',
            rating: 1.5,
            numberOfReviews: '145',
            goal: '\$67.5K',
            equity: '9%',
          ),
          videoCards(
            dataSource: 'assets/videos/pitch1.mp4',
            startUpName: 'Ibisu Cement',
            companyWebsite: 'ibisucement.com',
            imageUrl: 'assets/images/finop/logo1.jpeg',
            industry: 'Construction',
            rating: 1.0,
            numberOfReviews: '415',
            goal: '\$32K',
            equity: '18%',
          ),
        ],
      )),
    );
  }

  Widget videoCards({
    String dataSource,
    String startUpName,
    String industry,
    String numberOfReviews,
    double rating,
    String goal,
    String equity,
    String companyWebsite,
    String imageUrl,
    String dateEstablished,
  }) {
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
                      onTap: () {
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
                      child: AssetPlayerLifeCycle(
                        dataSource,
                        (BuildContext context,
                                VideoPlayerController controller) =>
                            AspectRatioVideo(controller),
                      ),
                    ),
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
                              padding: const EdgeInsets.only(
                                  left: 16, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ViewStartUpProfileScreen(),
                                          settings: RouteSettings(
                                            arguments: StartUpArguments(
                                              name: startUpName,
                                              equity: equity,
                                              industry: industry,
                                              companyName: startUpName,
                                              goal: goal,
                                              companyWebsite: companyWebsite,
                                              imageUrl: imageUrl,
                                              dateEstablished: dateEstablished,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      startUpName,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        industry,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.grey.withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          rating: rating,
                                          size: 20,
                                          color: HotelAppTheme.buildLightTheme()
                                              .primaryColor,
                                          borderColor:
                                              HotelAppTheme.buildLightTheme()
                                                  .primaryColor,
                                        ),
                                        Text(
                                          "$numberOfReviews Reviews",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
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
                                goal,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "$equity equity",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.withOpacity(0.8)),
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
