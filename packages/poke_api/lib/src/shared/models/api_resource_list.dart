

import 'package:poke_api/src/shared/models/models.dart';

class ApiResourceList<T extends ApiModel> {
  ApiResourceList({
    required this.count,
    required this.results,
    required this.next,
  });

  final int count;

  final List<T> results;

  final String next;

  int get nextOffset {
    return int.parse(Uri.parse(next).queryParameters['offset']!);
  }

  int get nextLimit {
    return int.parse(Uri.parse(next).queryParameters['limit']!);
  }
}
