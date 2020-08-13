import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_today/models/api_call.dart';
import 'package:wiki_today/utils/colors.dart';
import 'package:wiki_today/utils/size_helper.dart';
import 'package:wiki_today/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    replace();
    super.initState();
  }

  void replace() async {
    await dataReceive();
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 700),
            tween: Tween<dynamic>(begin: 0, end: 0.6),
            builder: (context, value, child) {
              return Image.asset(
                'assets/logo.png',
                width: displayWidth(context) * value,
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          TweenAnimationBuilder(
            tween: Tween<dynamic>(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 1500),
            builder: (context, value, child) {
              return Material(
                type: MaterialType.transparency,
                child: Text(
                  'Wiki-Today',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: displayWidth(context) * 0.11,
                    color: Color.fromRGBO(0, 0, 0, value),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
