import 'package:rick_and_morty/features/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({required name, required url}) : super(name: name, url: url);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json["name"], url: json['url']);
  }
}
