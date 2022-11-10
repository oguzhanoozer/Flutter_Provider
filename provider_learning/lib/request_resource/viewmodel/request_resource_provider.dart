import 'package:flutter/foundation.dart';

import '../model/resource_model.dart';
import '../service/request_resource_service.dart';

class RequestResourceProvider extends ChangeNotifier {
  bool isLoading = false;

  late IRequestResourceService resourceService;

  RequestResourceProvider() {
    resourceService = RequestResourceService();
    fetchData();
  }

  List<Data> resource = [];

  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchData() async {
    changeIsLoading();
    await fetchItems();
    changeIsLoading();
  }

  String data = "";

  Future<List<Data>> fetchItems() async {
    return resource = (await resourceService.fetchResource())?.data ?? [];
  }
}
