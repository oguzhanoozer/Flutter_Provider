import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_learning/request_resource/model/resource_model.dart';
import 'package:provider_learning/request_resource/service/network_manager.dart';

enum _requstResEnum { known }

abstract class IRequestResourceService {
  final Dio dio = NetworkManager.instance.dio;

  Future<ResourceModel?> fetchResource();
}

class RequestResourceService extends IRequestResourceService {
  @override
  Future<ResourceModel?> fetchResource() async {
    final response = await dio.get('/${_requstResEnum.known.name}');

    if (response.statusCode == HttpStatus.ok) {
      var jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        for (var item in jsonBody["data"]) {
          item["statusCode"] = 200;
        }
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
