import 'package:poke_api/src/shared/models/models.dart';

class ApiResource extends ApiModel {
  const ApiResource({
    required this.url,
    this.name,
  });

  final String url;

  final String? name;

  factory ApiResource.fromJson(Map<String, dynamic> json) {
    return ApiResource(
      url: json['url'],
      name: json['name'],
    );
  }

  int get id {
    final uri = Uri.parse(url);
    return int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
  }
}
