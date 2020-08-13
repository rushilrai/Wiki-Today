import 'package:flutter/material.dart';
import 'package:wiki_today/models/api_call.dart';
import 'package:wiki_today/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        color: whiteColor,
        child: Center(
          child: Center(
            child: (dataReceived)
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: deathsList.length,
                    itemBuilder: (context, index) {
                      return Text(deathsList[index]);
                    },
                  )
                : Text('post'),
          ),
        ),
      ),
    );
  }
}
