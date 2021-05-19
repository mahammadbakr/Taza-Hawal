import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:taza_hawal/Providers/LanguageAndCountryProvider.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';
import 'package:taza_hawal/Screens/DetailsScreen/DetailsScreen.dart';

import 'Helper/Theme.dart';
import 'Providers/AppSettingsProvider.dart';
import 'Providers/CategoryProvider.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/SplashScreen/SplashScreen.dart';

void main() {
  //STARTUP APPLICATION
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //GENERATE PROVIDERS
      providers: [
        ChangeNotifierProvider<AppSettingsProvider>(
          create: (context) => AppSettingsProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<LanguageAndCountryProvider>(
          create: (context) => LanguageAndCountryProvider(),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Taza Hawal',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        //GENERATE ROUTES
        initialRoute: SplashScreen.routeHomeScreen,
        routes: {
          SplashScreen.routeHomeScreen: (context) => SplashScreen(),
          HomeScreen.routeHomeScreen: (context) => HomeScreen(),
          DetailsScreen.routeDetailsScreen: (context) => DetailsScreen(),
        },
      ),
    );
  }
}
