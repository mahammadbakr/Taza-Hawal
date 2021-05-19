import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:taza_hawal/Models/News.dart';
import 'package:taza_hawal/Screens/DetailsScreen/DetailsScreen.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

import '../Constants.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailsScreen.routeDetailsScreen,arguments: news),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color: theme(context).dividerColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: news.urlToImage,
                placeholder: (context, url) =>Image.asset(Constants.placeHolder),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(news.author),
            ),
          ],
        ),
      ),
    );
  }
}