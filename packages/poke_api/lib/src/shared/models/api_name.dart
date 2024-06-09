import 'package:poke_api/src/shared/models/models.dart';

class ResourceName {
  final NamedApiResource language;
  final String name;

  ResourceName({
    required this.language,
    required this.name,
  });

  factory ResourceName.fromJson(Map<String, dynamic> json) => ResourceName(
        language: NamedApiResource.fromJson(json["language"]),
        name: json["name"],
      );
}
