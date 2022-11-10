// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class FirstModel extends ChangeNotifier {
  String value = "Hello there";

  void doSomething(String valueParam) {
    value = valueParam;
    notifyListeners();
  }
}

class SecondModel {
  final FirstModel _firstModel;
  SecondModel(this._firstModel);

  void doSomethingElse() {
    _firstModel.doSomething("Current Data is changing");
  }
}
