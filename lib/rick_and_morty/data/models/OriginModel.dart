// ignore_for_file: file_names

import 'package:rick_and_morty_app/rick_and_morty/domain/entites/OriginEntity.dart';

class OriginModel extends OriginEntity {
  const OriginModel({required super.name, required super.url});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(name: json["name"], url: json["url"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "url": url};
  }
}
