import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';
import 'package:taza_hawal/Screens/HomeScreen/HomeScreen.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

import '../../Constants.dart';

class SplashScreen extends StatefulWidget {
  static const routeHomeScreen = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataInToStates();
    Future.delayed(const Duration(milliseconds: 1200), () {
      // Do Something Before it Goes to Home Screen
      Navigator.pushNamed(context, HomeScreen.routeHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme(context).backgroundColor,
      body: Center(
        child: Image.asset(Constants.splash,scale: 4,),
      ),
    );
  }

  void getDataInToStates() {
    Provider.of<NewsProvider>(context, listen: false)
        .getAllNews();

  }


}
