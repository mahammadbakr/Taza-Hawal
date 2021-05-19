import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      // padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      height: 48,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(24)),
      child: TextFormField(
        onChanged: (text){
          Provider.of<NewsProvider>(context,listen: false).searchForNews(text: text);
        },
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            hintText: 'Search for Items',
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
            hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      // child: Row(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20),
      //       child: Icon(
      //         Icons.search,
      //         color: Colors.grey,
      //       ),
      //     ),
      //
      //   ],
      // ),
    );
  }
}
