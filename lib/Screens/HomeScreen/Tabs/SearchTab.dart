import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taza_hawal/Components/NewsPost.dart';
import 'package:taza_hawal/Components/SearchContainer.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchContainer(),
        Expanded(
          // height: MediaQuery.of(context).size.height-48-222,
          child: Consumer<NewsProvider>(
              builder: (_, newsState, __) => ListView.builder(
                  itemCount: newsState.searchedNews.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return NewsPost(news: newsState.searchedNews[index]);
                  })),
        )
      ],
    );
  }
}
