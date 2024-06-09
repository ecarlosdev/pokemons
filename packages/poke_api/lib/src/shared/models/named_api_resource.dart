
import 'package:poke_api/src/shared/models/models.dart';

class NamedApiResource extends ApiResource {
  const NamedApiResource({
    required this.name,
    required super.url,
  });

  final String name;

  factory NamedApiResource.fromJson(Map<String, dynamic> json) {
    return NamedApiResource(
      name: json['name'],
      url: json['url'],
    );
  }
}
