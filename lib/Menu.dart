import 'dart:math';

import 'package:flutter/material.dart';


import 'info.dart';

class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _menuIconkey = GlobalKey();

  final Color _menuBg = Color.fromRGBO(1, 50, 150, 80);

  Animation<double> _menuAnimation;

  Animation<double> _toolbarTitleFadeAnimation;

  AnimationController _guillotineMenuAnimationController;

  @override
  void initState() {
    super.initState();

/*
This is to check the offset of the menu Icon in top left corner.
    // WidgetsBinding.instance.addPostFrameCallback(_getPosition);
*/

    _guillotineMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    )..addListener(() {
        setState(() {});
      });

    // Menu Animation

    _menuAnimation = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _guillotineMenuAnimationController,
        curve: Curves.easeOutSine,
        reverseCurve: Curves.easeInSine));

    // Toolbar Title Transition

    _toolbarTitleFadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_guillotineMenuAnimationController);
  }

  _getPosition(_) {
    _getOffset();
  }

  void _getOffset() {
    final RenderBox offsetBox = _menuIconkey.currentContext.findRenderObject();
    final Offset offset = offsetBox.localToGlobal(Offset.zero);
    print("Offset : $offset");
  }

  @override
  void dispose() {
    super.dispose();
    _guillotineMenuAnimationController.dispose();
  }

  void _onMenuIconClick() {
    if (_isMenuVisible()) {
      _guillotineMenuAnimationController.reverse();
    } else {
      _guillotineMenuAnimationController.forward();
    }
  }

  bool _isMenuVisible() {
    final AnimationStatus status = _guillotineMenuAnimationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _menuAnimation.value,
      origin: Offset(32.0, 50.0),
      alignment: Alignment.topLeft,
      child: Material(
        
        color: Colors.black87,
        child: SafeArea(
          child: Container(
            
            height: SizeConfig.screenHeight/1.30 ,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _toolbar(),
                ),
                Expanded(
                  flex: 8,
                  child: _menuItems(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return RotatedBox(
      quarterTurns: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          // padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: <Widget>[_toolbarIcon(), _toolbarTitle(), _addSymbol()],
          ),
        ),
      ),
    );
  }

  Widget _toolbarIcon() {
    return IconButton(
      key: _menuIconkey,
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () => _onMenuIconClick(),
    );
  }

  Widget _addSymbol() {
    return FadeTransition(
        opacity: _toolbarTitleFadeAnimation,
          child: Padding(
        padding: EdgeInsets.only(left: 135),
        child: IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _toolbarTitle() {
    return FadeTransition(
      opacity: _toolbarTitleFadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(left: 100),
        child: Text(
          "Feeds",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _menuItems() {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 80 ),
      child: Container(
       
        child: Column(
          children: <Widget>[
            Container(
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 5, color: Colors.black87),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white70.withOpacity(0.9),
                          spreadRadius: 12,
                          blurRadius: 12,
                          offset: Offset(0, 3))
                    ],
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                            "assets/profile.jpeg")))),
            Padding(
              padding:  EdgeInsets.only(top:25,left: 45),
              child: Row(
                children: <Widget>[
                  Text("MARK RONSON",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                   
                  ),)],
              ),
            ),
         SizedBox(height: 10,),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Text(
                "PROFILE",
                style:
                    TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.rss_feed,
                color: Colors.white,
              ),
              title: Text(
                "FEED",
                style:
                    TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.local_activity,
                color: Colors.white,
              ),
              title: Text(
                "ACTIVITY",
                style:
                    TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "SETTINGS",
                style:
                    TextStyle(color: Colors.white),
              ),
            ),
             ListTile(
              leading: Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              title: Text(
                "LOGOUT",
                style:
                    TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
