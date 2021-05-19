import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Constants.dart';

enum CategoryType { political, action, technology, health }

class CategoryProvider extends ChangeNotifier {
  CategoryType currentCat = CategoryType.political;

  void setCurrentCategory(CategoryType cat) {
    currentCat = cat;
    notifyListeners();
  }

  CategoryType getCurrentCategory() {
    // ignore: unnecessary_null_comparison
    if (currentCat == null) {
      return CategoryType.political;
    }
    return currentCat;
  }

  List<String> categoryNames = ["Political", "Action", "Technology", "Health"];

  List<String> categoryImages = [
    Constants.politicalIcon,
    Constants.actionIcon,
    Constants.technologyIcon,
    Constants.healthIcon
  ];
}
