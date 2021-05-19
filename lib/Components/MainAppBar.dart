import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Constants.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

class MainAppBar extends StatelessWidget {
  final BuildContext context;
  final String title;
  final IconData icon;
  // final Function onPressed;

  MainAppBar(
      {required this.context,required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(

        children: [
          // Image.asset(Constants.worldLogo,height: 25,),
          // SizedBox(width: 6,),
          Text(title.toUpperCase(),style: theme(context).textTheme.button!
              .copyWith(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xffeddaa6)),),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(Constants.worldLogo),
      )
    );
  }
}
