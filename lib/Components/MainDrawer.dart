import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Settings",
                style: theme(context).textTheme.button,
              ),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title:
                  Text("Edit Profile", style: theme(context).textTheme.button),
              leading: Icon(Icons.person_rounded),
            ),
            ListTile(
              title: Text("Change Language",
                  style: theme(context).textTheme.button),
              leading: Icon(Icons.language),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {  },
                      child: Text('Log Out'),
                    ),
                    Spacer(),
                    Text('© bazaryonline')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
