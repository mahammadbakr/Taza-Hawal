import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:taza_hawal/Components/MainAppBar.dart';
import 'package:taza_hawal/Components/MainDrawer.dart';
import 'package:taza_hawal/Providers/AppSettingsProvider.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

import '../../Constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeHomeScreen = '/home';

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Constants.appBarHeight),
        child: MainAppBar(
          context: context,
          title: settings.getCurrentNavigationTabName(),
          icon: Icons.menu,
        ),
      ),
      drawer: MainDrawer(),
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: theme(context).backgroundColor,
      body: settings.getCurrentNavigationTab(),
      bottomNavigationBar: Consumer<AppSettingsProvider>(
        builder: (_, state, __) => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: state.navigationIcons[0],
              label: state.navigationNames[0],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[1],
              label: state.navigationNames[1],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[2],
              label: state.navigationNames[2],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[3],
              label: state.navigationNames[3],
            ),
          ],
          backgroundColor: theme(context).backgroundColor,
          unselectedItemColor: theme(context).primaryColor,
          selectedLabelStyle: theme(context).textTheme.bodyText2,
          unselectedLabelStyle: theme(context).textTheme.bodyText2,
          currentIndex: state.getCurrentNavigation(),
          selectedItemColor: theme(context).accentColor,
          onTap: (newState) {
            state.setNavigationType(newState);
          },
        ),
      ),
    );
  }
}
