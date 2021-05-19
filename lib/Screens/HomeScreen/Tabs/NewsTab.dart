import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taza_hawal/Components/NewsCard.dart';
import 'package:taza_hawal/Components/NewsPost.dart';
import 'package:taza_hawal/Models/LanguageAndCountry.dart';
import 'package:taza_hawal/Models/News.dart';
import 'package:taza_hawal/Providers/LanguageAndCountryProvider.dart';
import 'package:taza_hawal/Providers/NewsProvider.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageAndCountryProvider>(
        builder: (_, lanState, __) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        "Latest News",
                        style: theme(context).textTheme.headline5,
                      ),
                      Spacer(),
                      getCountryAndLanguage(lanState),
                    ],
                  ),
                ),
                Expanded(
                    child: Consumer<NewsProvider>(
                        builder: (_, newsState, __) => ListView.builder(
                            itemCount: newsState.allNews.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return NewsPost(news: newsState.allNews[index]);
                            })))
              ],
            ));
  }

  Widget getCountryAndLanguage(LanguageAndCountryProvider lanState) {
    return PopupMenuButton<LanguageAndCountry>(
        initialValue: lanState.lanAndCountry == null
            ? lanState.getAllLanAndCountries()[0]
            : lanState.lanAndCountry,
        // ignore: unnecessary_null_comparison
        child: Row(
          children: [
            Image.network(
              lanState.lanAndCountry.image,
              height: 20,
            ),
            SizedBox(
              width: 4,
            ),
            Text(lanState.lanAndCountry == null
                ? lanState.getAllLanAndCountries()[0].name +
                    "(${lanState.lanAndCountry.country})"
                : lanState.lanAndCountry.name +
                    "(${lanState.lanAndCountry.country})"),
          ],
        ),
        onSelected: (LanguageAndCountry value) async {
          setState(() {
            lanState.setLanguageAndCountry(value);
          });
        },
        itemBuilder: (BuildContext context) {
          return lanState
              .getAllLanAndCountries()
              .map(
                (i) => PopupMenuItem<LanguageAndCountry>(
                    enabled: i.country == "US" ? true : false,
                    value: i,
                    child: Row(
                      children: [
                        Image.network(
                          i.image,
                          height: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(i.name.toString() + "(${i.country})"),
                      ],
                    )),
              )
              .toList();
        });
  }
}
