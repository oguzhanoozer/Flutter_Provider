import 'package:flutter/material.dart';

class ResourceContext extends ChangeNotifier{
  List<String> studentList = [];

  void savedModel(List<String> list) {
    studentList = list;
  }

  void addNewItem(String item) {
    studentList.add(item);
    notifyListeners();
  }
}
