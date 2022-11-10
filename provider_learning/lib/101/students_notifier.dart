import 'package:flutter/foundation.dart';
import 'package:provider_learning/101/resource_context.dart';

class StudentsNotifier extends ChangeNotifier {
  List<String> studentsList = ["Oğuzhan", "Ozer", "Co", "Bozo", "Bozok"];
  bool isLoading = false;

  void changeIsLoading() {
    Future.microtask(() => Future.delayed(const Duration(seconds: 3)));
    isLoading = !isLoading;
    notifyListeners();
  }

  void addStudent(String name) {
    studentsList.add(name);
    notifyListeners();
  }

  void savedList(ResourceContext resourceContext) {
    resourceContext.savedModel(studentsList);
  }

  void addNewItem(ResourceContext resourceContext, String item) {
    studentsList.add(item);
    savedList(resourceContext);
  }
}
