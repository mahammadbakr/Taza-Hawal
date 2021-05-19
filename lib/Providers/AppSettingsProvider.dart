import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Screens/HomeScreen/Tabs/NewsTab.dart';
import 'package:taza_hawal/Screens/HomeScreen/Tabs/HomeTab.dart';
import 'package:taza_hawal/Screens/HomeScreen/Tabs/DevelopersTab.dart';
import 'package:taza_hawal/Screens/HomeScreen/Tabs/SearchTab.dart';


enum NavigationType { home, search, news, developers }

class AppSettingsProvider extends ChangeNotifier {
  NavigationType currentNav = NavigationType.home;

  void setNavigationType(int index) {
    index == 0
        ? currentNav = NavigationType.home
        : index == 1
            ? currentNav = NavigationType.search
            : index == 2
                ? currentNav = NavigationType.news
                : currentNav = NavigationType.developers;
    notifyListeners();
  }

  int getCurrentNavigation() {
    // ignore: unnecessary_null_comparison
    if (currentNav == null) {
      return 0;
    }
    int index;
    currentNav == NavigationType.home
        ? index = 0
        : currentNav == NavigationType.search
            ? index = 1
            :  currentNav == NavigationType.news
        ? index = 2 : index = 3;
    return index;
  }

  Widget getCurrentNavigationTab() {
    Widget tab;
    currentNav == NavigationType.home
        ? tab = HomeTab()
        : currentNav == NavigationType.search
            ? tab = SearchTab()
            : currentNav == NavigationType.news
        ? tab = CartTab() : tab = DevelopersTab();
    return tab;
  }

  String getCurrentNavigationTabName() {
    String tabName;
    currentNav == NavigationType.home
        ? tabName = "Home"
        : currentNav == NavigationType.search
            ? tabName = "Search"
            :currentNav == NavigationType.news
        ? tabName = "News"
        : tabName = "Developers";
    return tabName;
  }

  List<String> navigationNames = ["Home", "Search", "News", "Developers"];

  List<Widget> navigationIcons = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.public),
    Icon(Icons.developer_mode_sharp)
  ];
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:taza_hawal/Screens/HomeScreen/Tabs/NewsTab.dart';
// import 'package:taza_hawal/Screens/HomeScreen/Tabs/HomeTab.dart';
// import 'package:taza_hawal/Screens/HomeScreen/Tabs/DevelopersTab.dart';
//
// enum NavigationType { home, cart, profile }
//
// class AppSettingsProvider extends ChangeNotifier {
//   NavigationType currentNav = NavigationType.home;
//
//   void setNavigationType(int index) {
//     index == 0
//         ? currentNav = NavigationType.home
//         : index == 1
//         ? currentNav = NavigationType.cart
//         : currentNav = NavigationType.profile;
//     notifyListeners();
//   }
//
//   int getCurrentNavigation() {
//     // ignore: unnecessary_null_comparison
//     if (currentNav == null) {
//       return 0;
//     }
//     int index;
//     currentNav == NavigationType.home
//         ? index = 0
//         :  currentNav == NavigationType.cart
//         ? index = 1
//         : index = 2;
//     return index;
//   }
//
//   Widget getCurrentNavigationTab() {
//     Widget tab;
//     currentNav == NavigationType.home
//         ? tab = HomeTab()
//         : currentNav == NavigationType.cart
//         ? tab = CartTab()
//         : tab = ProfileTab();
//     return tab;
//   }
//
//   String getCurrentNavigationTabName() {
//     String tabName;
//     currentNav == NavigationType.home
//         ? tabName = "Home"
//         : currentNav == NavigationType.cart
//         ? tabName = "Cart"
//         : tabName = "Profile";
//     return tabName;
//   }
//
//   List<String> navigationNames = ["Home", "Cart", "Profile"];
//
//   List<Widget> navigationIcons = [
//     Icon(Icons.home),
//     Icon(Icons.shopping_cart),
//     Icon(Icons.person)
//   ];
// }
