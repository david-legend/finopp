import 'package:finop/screens/app/navigation_home_screen.dart';
import 'package:finop/screens/registration/choice_screen.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/setup_investor_screen.dart';
import 'package:finop/screens/registration/setup_startup_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:finop/screens/root_page.dart';
import 'package:finop/services/authentication.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white,
//        ico
      ),
//      home: '/choiceScreen',
      routes: {
        RootPage.ROUTE_NAME: (context) => RootPage(auth: new Auth(),),
        ChoiceScreen.ROUTE_NAME: (context) => ChoiceScreen(),
        LoginScreen.ROUTE_NAME: (context) => LoginScreen(auth: Auth(),),
        SignUpScreen.ROUTE_NAME: (context) => SignUpScreen(auth: Auth(),),
        SetupStartUpScreen.ROUTE_NAME: (context) => SetupStartUpScreen(),
        SetupInvestorScreen.ROUTE_NAME: (context) => SetupInvestorScreen(),
        NavigationHomeScreen.ROUTE_NAME: (context) => NavigationHomeScreen(),
      },
    );
  }
}



//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
//
//void main() => runApp(VideoPlayerApp());
//
//class VideoPlayerApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Video Player Demo',
//      home: VideoPlayerScreen(),
//    );
//  }
//}
//
//class VideoPlayerScreen extends StatefulWidget {
//  VideoPlayerScreen({Key key}) : super(key: key);
//
//  @override
//  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
//}
//
//class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//  VideoPlayerController _controller;
//  Future<void> _initializeVideoPlayerFuture;
//
//  @override
//  void initState() {
//    // Create and store the VideoPlayerController. The VideoPlayerController
//    // offers several different constructors to play videos from assets, files,
//    // or the internet.
//    _controller = VideoPlayerController.network(
//      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//    );
//
//    // Initialize the controller and store the Future for later use.
//    _initializeVideoPlayerFuture = _controller.initialize();
//
//    // Use the controller to loop the video.
//    _controller.setLooping(true);
//
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    // Ensure disposing of the VideoPlayerController to free up resources.
//    _controller.dispose();
//
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Butterfly Video'),
//      ),
//      // Use a FutureBuilder to display a loading spinner while waiting for the
//      // VideoPlayerController to finish initializing.
//      body: FutureBuilder(
//        future: _initializeVideoPlayerFuture,
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            // If the VideoPlayerController has finished initialization, use
//            // the data it provides to limit the aspect ratio of the video.
//            return AspectRatio(
//              aspectRatio: _controller.value.aspectRatio,
//              // Use the VideoPlayer widget to display the video.
//              child: VideoPlayer(_controller),
//            );
//          } else {
//            // If the VideoPlayerController is still initializing, show a
//            // loading spinner.
//            return Center(child: CircularProgressIndicator());
//          }
//        },
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          // Wrap the play or pause in a call to `setState`. This ensures the
//          // correct icon is shown.
//          setState(() {
//            // If the video is playing, pause it.
//            if (_controller.value.isPlaying) {
//              _controller.pause();
//            } else {
//              // If the video is paused, play it.
//              _controller.play();
//            }
//          });
//        },
//        // Display the correct icon depending on the state of the player.
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}