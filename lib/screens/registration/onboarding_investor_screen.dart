import 'package:finop/const/_const.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transformer_page_view/index_controller.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class InvestorOnboardingScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/investorOnboardingScreen';

  @override
  _InvestorOnboardingScreenState createState() =>
      _InvestorOnboardingScreenState();
}

class _InvestorOnboardingScreenState extends State<InvestorOnboardingScreen> {
  int _slideIndex = 0;

  final List<String> images = [
    OnboardingImagePath.onboardingInvestor1,
    OnboardingImagePath.onboardingInvestor2,
    OnboardingImagePath.onboardingInvestor3,
  ];

  final List<String> text0 = [
    "Search for startups",
    "Analyse and choose viable ideas",
    "Invest in a startup",
  ];

  final List<String> text1 = [
    "App for food lovers, satisfy your taste",
    "Find best meals in your area, simply",
    "Find best meals in your area, simply",
  ];

  final IndexController _controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index) {
        setState(() {
          this._slideIndex = index;
        });
      },
      loop: false,
      controller: _controller,
      transformer:
          PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
        return Material(
          color: Colors.white,
          elevation: 8.0,
          textStyle: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ParallaxContainer(
                        child: SvgPicture.asset(
                          images[info.index],
                          fit: BoxFit.contain,
                          height: 250,
                        ),
                        position: info.position,
                        translationFactor: 400.0,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ParallaxContainer(
                        child: Text(
                          text0[info.index],
                          textAlign: TextAlign.center,
                          style: bigHeadingStyle,
                        ),
                        position: info.position,
                        opacityFactor: .8,
                        translationFactor: 400.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ParallaxContainer(
                        child: Text(
                          text1[info.index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        position: info.position,
                        translationFactor: 300.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ParallaxContainer(
                        position: info.position,
                        translationFactor: 500.0,
                        child: Dots(
                          controller: _controller,
                          slideIndex: _slideIndex,
                          numberOfDots: images.length,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          bool didSliderMove = moveSlider(_slideIndex, images.length);
                          if (didSliderMove == false) {
                            Navigator.pushNamed(
                                context, SignUpScreen.ROUTE_NAME);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: kFINOP_PRIMARY,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
      itemCount: 3,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: transformerPageView,
    );
  }

  bool moveSlider(int index, int numberOfSliders) {
    print("INDEX : $index NUM OF SLIDERS : $numberOfSliders");
    if (index <= numberOfSliders - 2) {
      _controller.move(index + 1);
      return true;
    }

    return false;
  }
}

class Dots extends StatelessWidget {
  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;

  Dots({this.controller, this.slideIndex, this.numberOfDots});

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 11.0,
            height: 11.0,
            decoration: BoxDecoration(
              color: kFINOP_PRIMARY,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateDots(),
    ));
  }
}
