import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/screens/app/home.dart';
import 'package:finop/screens/app/startup_feed.dart';
import 'package:finop/screens/app/startup_profile.dart';
import 'package:finop/screens/app/user_profile_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chats.dart';
import 'investor_feed.dart';
import 'investor_feed_screen.dart';

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color = Colors.white,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
          ),
          backgroundColor: color,
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = controller.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  Animation<double> _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(
            begin: const Offset(0.0, 0.02), // Slightly down.
            end: Offset.zero,
          ),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class NavigationHomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/navigationHomeScreen';

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> _drawerContents = <String>[
    'Profile',
    'Chats',
    'Settings',
    'Sign out',
  ];

  String pageTitle = 'Home';

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    StartUpFeed(),
    InvestorFeed(),
    InvestorFeed(),
  ];
  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: const Icon(
          FontAwesomeIcons.home,
        ),
        title: 'Home',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          FontAwesomeIcons.chartLine,
        ),
        title: 'Startups',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          FontAwesomeIcons.donate,
        ),
        title: 'Investors',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          FontAwesomeIcons.plus,
        ),
        title: 'Add',
        vsync: this,
      ),
    ];

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text("This feature has not been implemented yet!"),
    ));
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[
      for (NavigationIconView view in _navigationViews)
        view.transition(_type, context),
    ];

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      selectedItemColor: kFINOP_PRIMARY,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          switch (_currentIndex) {
            case 0:
              pageTitle = 'Home';
              break;
            case 1:
              pageTitle = 'Startups';
              break;
            case 2:
              pageTitle = 'Investors';
              break;
            case 3:
              pageTitle = 'Add';
              break;
          }
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

//    _scaffoldKey.currentState.openDrawer();
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
          child: InkWell(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImagePath.accountProfilePhoto),
            ),
          ),
        ),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
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
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Raleway',
              ),
              hintText: "Search for startups or investors",
              fillColor: kFINOP_SEARCH_BAR_BG,
            ),
          ),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pushNamed(context, Chats.ROUTE_NAME),
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: kFINOP_SECONDARY,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '4',
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: UserAccountsDrawerHeader(
                accountName: const Text(
                  'David Cobbina',
                  style: onlyFontTextStyle,
                ),
                accountEmail: const Text(
                  'david.cobbina@example.com',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage(AppImagePath.accountProfilePhoto),
                ),
                margin: EdgeInsets.zero,
                onDetailsPressed: () {
                  _showDrawerContents = !_showDrawerContents;
                  if (_showDrawerContents)
                    _controller.reverse();
                  else
                    _controller.forward();
                },
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: Expanded(
                child: ListView(
                  dragStartBehavior: DragStartBehavior.down,
                  padding: const EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // The initial contents of the drawer.
                        FadeTransition(
                          opacity: _drawerContentsOpacity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  'Profile',
                                  style: onlyFontTextStyle,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, StartUpProfile.ROUTE_NAME);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.chat),
                                title: Text(
                                  'Chat',
                                  style: onlyFontTextStyle,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Chats.ROUTE_NAME);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text(
                                  'Settings',
                                  style: onlyFontTextStyle,
                                ),
                                onTap: _showNotImplementedMessage,
                              ),
                              ListTile(
                                leading: Icon(Icons.power_settings_new),
                                title: Text(
                                  'Sign Out',
                                  style: onlyFontTextStyle,
                                ),
                                onTap: _showNotImplementedMessage,
                              ),
                            ],
                          ),
                        ),
                        // The drawer's "details" view.
                        SlideTransition(
                          position: _drawerDetailsPosition,
                          child: FadeTransition(
                            opacity: ReverseAnimation(_drawerContentsOpacity),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.add),
                                  title: const Text(
                                    'Create a new account',
                                    style: onlyFontTextStyle,
                                  ),
                                  onTap: _showNotImplementedMessage,
                                ),
                                ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text(
                                    'Manage accounts',
                                    style: onlyFontTextStyle,
                                  ),
                                  onTap: _showNotImplementedMessage,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
