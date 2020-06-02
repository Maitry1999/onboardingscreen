import 'package:flutter/material.dart';
import 'package:onboardingscreen/MyHomePage.dart';

import 'info.dart';
import 'mypainter.dart';

class MyPageThree extends StatefulWidget {
  @override
  State createState() {
    return _MyPageThreeState();
  }
}

class _MyPageThreeState extends State<MyPageThree> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: [
                  Colors.white70,
                  Colors.black87,
                  Colors.blueAccent,
                ]))),
            Container(child: MyPainter(Colors.pink)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 6.4,
                      right: SizeConfig.blockSizeHorizontal * 6.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'creatium',
                        style: TextStyle(
                            fontFamily: 'Header',
                            fontSize: SizeConfig.blockSizeHorizontal * 5.2,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                            color: Colors.black87),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Header',
                            fontSize: SizeConfig.blockSizeHorizontal * 3.4,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Center(
                  child: Image.asset(
                    'assets/Intro3.gif',
                    fit: BoxFit.contain,
                    width: SizeConfig.blockSizeHorizontal * 90,
                    height: SizeConfig.blockSizeVertical * 44,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "FULL",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: SizeConfig.blockSizeHorizontal * 7.6,
                        color: Colors.white70,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "INFORMATION",
                    style: TextStyle(
                        letterSpacing: 4,
                        fontSize: SizeConfig.blockSizeHorizontal * 10.2,
                        color: Colors.white70,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14,
                      right: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "Then, as you begin to further flesh out your speech, you will use supporting materials, like examples, statistics, testimony or a narrative, that back your claims. These will add credibility to your speech.",
                    style: TextStyle(
                        letterSpacing: 0.4,
                        fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                        color: Colors.white70),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 40,
                      right: SizeConfig.blockSizeHorizontal * 14),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.2,
                        backgroundColor: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal * 1.5,
                          backgroundColor: Colors.black87),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.2,
                        backgroundColor: Colors.blueGrey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
