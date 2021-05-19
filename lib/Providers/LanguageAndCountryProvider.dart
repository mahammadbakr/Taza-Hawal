import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Constants.dart';
import 'package:taza_hawal/Models/LanguageAndCountry.dart';

class LanguageAndCountryProvider extends ChangeNotifier {
  LanguageAndCountry lanAndCountry = LanguageAndCountry(
      name: "English",
      country: "US",
      image:
      "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png");

  void setLanguageAndCountry(LanguageAndCountry lan) {
    lanAndCountry = lan;
    notifyListeners();
  }

  LanguageAndCountry getCurrentCategory() {
    // ignore: unnecessary_null_comparison
    if (lanAndCountry == null) {
      return LanguageAndCountry(
          name: "English",
          country: "US",
          image:
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png");
    }
    return lanAndCountry;
  }

  List<LanguageAndCountry> getAllLanAndCountries() {
    List<LanguageAndCountry> list= [
      LanguageAndCountry(
          name: "English",
          country: "US",
          image:
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png"),
      LanguageAndCountry(
          name: "Arabic",
          country: "UAE",
          image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1280px-Flag_of_the_United_Arab_Emirates.svg.png"),
    LanguageAndCountry(
          name: "English",
          country: "UK",
          image:
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.png"),
    ];
    return list;
  }
}
