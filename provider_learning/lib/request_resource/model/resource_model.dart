import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

int _fetchJson(args) {
  if (args == 2001) {
    return 2022;
  } else {
    return args;
  }
}

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  final int? id;

  ///@JsonKey(name: "isim")
  final String? name;
  @JsonKey(fromJson: _fetchJson)
  final int? year;
  final String? color;
  final StatusCode? statusCode;
  final String? pantoneValue;

  Data({this.statusCode, this.id, this.name, this.year, this.color, this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  warning
}
