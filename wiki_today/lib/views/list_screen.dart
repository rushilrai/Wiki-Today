import 'package:flutter/material.dart';
import 'package:wiki_today/models/api_call.dart';
import 'package:wiki_today/utils/colors.dart';
import 'package:wiki_today/utils/size_helper.dart';

class ListScreen extends StatefulWidget {
  String list;
  ListScreen(this.list);
  @override
  _ListScreenState createState() => _ListScreenState(list);
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  String list;
  _ListScreenState(this.list);
  AnimationController fadeController;
  Animation fadeAnimation;
  AnimationController slideController;
  Animation slideAnimation;
  @override
  void initState() {
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
                      child: Text(
                        list,
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (list == 'Births')
                      ? birthsList.length
                      : (list == 'Deaths')
                          ? deathsList.length
                          : (list == 'Events')
                              ? eventsList.length
                              : holidaysList.length,
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SelectableText(
                              (list == 'Births')
                                  ? birthsList[index]
                                  : (list == 'Deaths')
                                      ? deathsList[index]
                                      : (list == 'Events')
                                          ? eventsList[index]
                                          : holidaysList[index],
                              style: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
