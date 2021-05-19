import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Constants.dart';
import 'package:taza_hawal/Helper/HawalHttp.dart';
import 'package:taza_hawal/Models/LanguageAndCountry.dart';
import 'package:taza_hawal/Models/News.dart';

class NewsProvider extends ChangeNotifier {
   String urlHost =
      "https://newsapi.org/v2/everything";

List<dynamic> allNews = [];
List<dynamic> searchedNews = [];


// q=tesla&apiKey=${Constants.API_KEY}


Future<void> getAllNews() async {
  var response = await getHTTP(url: "${urlHost}?domains=techcrunch.com,thenextweb.com&apiKey="+Constants.API_KEY );
  // ignore: unnecessary_null_comparison
  if (response == null) {
    print("ERRRORRR Response");
  }
  // print(response);
  allNews = response["articles"].map((data) => News.fromJson(data)).toList();
  searchedNews = allNews;
  notifyListeners();
}

  Future<void>searchForNews({required String text}) async {
  if(text=="" || text.isEmpty){
    searchedNews=allNews;
    notifyListeners();
  }else {
    var response = await getHTTP(
        url: "${urlHost}?q=${text}&apiKey=" + Constants.API_KEY);
    // ignore: unnecessary_null_comparison
    if (response == null) {
      print("ERRRORRR Response");
    }
    // print(response);
    searchedNews =
        response["articles"].map((data) => News.fromJson(data)).toList();
    notifyListeners();
  }
  }

  Future<void> clearSearch() async{
  searchedNews=allNews;
  notifyListeners();
  }

}