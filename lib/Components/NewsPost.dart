import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:taza_hawal/Models/News.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

import '../Constants.dart';

class NewsPost extends StatelessWidget {
  final News news;

  const NewsPost({required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details'),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: news.urlToImage,
                  placeholder: (context, url) =>Image.asset(Constants.placeHolder),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10,vertical: 4),
              child: Column(
                children: [
                  Text(news.title,style: theme(context).textTheme.headline5,),
                  Text(news.content),
                ],
              ),
            ),

            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}