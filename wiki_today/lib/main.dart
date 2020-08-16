import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wiki_today/utils/colors.dart';
import 'package:wiki_today/views/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: whiteColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: whiteColor,
      ),
      child: GetMaterialApp(
        title: 'Wiki-Today',
        home: SplashScreen(),
      ),
    );
  }
}
