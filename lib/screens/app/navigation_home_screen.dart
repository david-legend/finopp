import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chats.dart';
import 'chats2.dart';
import 'home_screen.dart';

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
          title: Text(
            title,
            style: TextStyle(
              color: Colors.grey,
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
    'Settings',
    'Chats',
    'Account',
    'Profile',
    'Sign out',
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
          Icons.home,
          color: Colors.grey,
        ),
        title: 'Home',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        title: 'Search',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          Icons.notifications,
          color: Colors.grey,
        ),
        title: 'Nofications',
        vsync: this,
      ),
      NavigationIconView(
        icon: const Icon(
          Icons.mail_outline,
          color: Colors.grey,
        ),
        title: 'Messages',
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
      content: Text("The drawer's items don't do anything"),
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
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 25.0,
              height: 25.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/finop/david.jpg'),
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: UserAccountsDrawerHeader(
                accountName: const Text('David Cobbina'),
                accountEmail: const Text('david.cobbina@example.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/finop/david.jpg'),
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
                            children: _drawerContents.map<Widget>((String id) {
                              return ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('$id'),
                                onTap: _showNotImplementedMessage,
                              );
                            }).toList(),
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
                                  title: const Text('Create a new account'),
                                  onTap: _showNotImplementedMessage,
                                ),
                                ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text('Manage accounts'),
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
      body: ChatsPage(), //HomeScreen(), //Chats(),
//      Center(
//        child: _buildTransitionsStack(),
//      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
