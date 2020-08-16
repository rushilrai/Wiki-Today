import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wiki_today/models/api_call.dart';
import 'package:wiki_today/utils/colors.dart';
import 'package:wiki_today/utils/size_helper.dart';
import 'package:wiki_today/views/list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var now;
  var date;
  AnimationController fadeController;
  Animation fadeAnimation;
  AnimationController slideController;
  Animation slideAnimation;
  @override
  void initState() {
    now = DateTime.now();
    date = DateFormat("d'th' LLLL").format(now);
    fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(fadeController);
    slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    slideAnimation = Tween(
      begin: Offset(-0.5, 0),
      end: Offset(0, 0),
    ).animate(slideController);
    slideController.forward();
    fadeController.forward();
    super.initState();
  }

  @override
  void dispose() {
    fadeController.dispose();
    slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          color: whiteColor,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Material(
                      type: MaterialType.transparency,
                      child: GestureDetector(
                        onTap: () {
                          dataReceive();
                        },
                        child: Text(
                          'Wiki-Today',
                          style: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: AnimatedContainer(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: RaisedButton(
                              onPressed: () {
                                Get.to(
                                  ListScreen('Births'),
                                );
                              },
                              color: whiteColor,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 30,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            'Births',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  displayWidth(context) * 0.08,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 200),
                          width: displayWidth(context) * 0.4,
                          height: displayWidth(context) * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 15),
                                spreadRadius: -5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: AnimatedContainer(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: RaisedButton(
                              color: whiteColor,
                              onPressed: () {
                                Get.to(
                                  ListScreen('Deaths'),
                                );
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 30,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            'Deaths',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  displayWidth(context) * 0.08,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 200),
                          width: displayWidth(context) * 0.4,
                          height: displayWidth(context) * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 15),
                                spreadRadius: -5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: AnimatedContainer(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: RaisedButton(
                              color: whiteColor,
                              onPressed: () {
                                Get.to(
                                  ListScreen('Events'),
                                );
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Icon(
                                            Icons.supervisor_account,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            'Events',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  displayWidth(context) * 0.08,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 200),
                          width: displayWidth(context) * 0.4,
                          height: displayWidth(context) * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 15),
                                spreadRadius: -5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: AnimatedContainer(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: RaisedButton(
                              color: whiteColor,
                              onPressed: () {
                                Get.to(
                                  ListScreen('Holidays'),
                                );
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            'Holidays',
                                            style: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  displayWidth(context) * 0.08,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 200),
                          width: displayWidth(context) * 0.4,
                          height: displayWidth(context) * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 15),
                                spreadRadius: -5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
