import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:poke_api/src/shared/models/models.dart';

abstract class PokeApiV2Baseclient<T extends ApiModel> extends http.BaseClient {
  PokeApiV2Baseclient({
    http.Client? client,
  })  : _client = client ?? http.Client(),
        super();

  static const String _baseScheme = 'https';

  static const String _baseHost = 'pokeapi.co';

  static const String _basePath = 'api/v2';

  static Map<String, dynamic> _simpleCache = {};

  final http.Client _client;

  T mapResource(Map<String, dynamic> json);

  String get resourcePath;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final url = request.url;
    final newUrl = url.replace(
      pathSegments: <String>[
        _basePath,
        url.path,
      ],
      scheme: _baseScheme,
      host: _baseHost,
      queryParameters: request.url.queryParameters,
    );
    return _client.send(http.Request(request.method, newUrl));
  }

  Future<ApiResourceList<T>> list({
    required int offset,
    required int limit,
  }) async {
    final requestHash = "$resourcePath-$offset-$limit";
    if (_simpleCache.containsKey(requestHash)) {
      return _simpleCache[requestHash] as ApiResourceList<T>;
    }

    final apiResourceList = await resourceList(
      offset: offset,
      limit: limit,
    );

    final resources = await byIdList(
      apiResourceList.results.map((e) => e.id).toList(),
    );

    final result = ApiResourceList<T>(
      count: apiResourceList.count,
      next: apiResourceList.next,
      results: resources.whereType<T>().toList(),
    );
    _simpleCache[requestHash] = result;
    return result;
  }

  Future<List<T>> byIdList(List<int> ids) async {
    final modelResponses = <Future<T?>>[];
    for (final id in ids) {
      modelResponses.add(byId(id));
    }
    return Future.wait(modelResponses).then(
      (value) => value.whereType<T>().toList(),
    );
  }

  Future<T?> byId(int id) async {
    final requestHash = "$resourcePath-$id";
    if (_simpleCache.containsKey(requestHash)) {
      return _simpleCache[requestHash] as T;
    }
    final uri = Uri.parse("").replace(
      pathSegments: <String>[
        resourcePath,
        id.toString(),
      ],
    );
    final response = await get(uri);
    final json = response.body;
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final result = mapResource(decoded);
    _simpleCache[requestHash] = result;
    return result;
  }

  Future<List<T>> byNameList(List<String> names) async {
    final modelResponses = <Future<T?>>[];
    for (final name in names) {
      modelResponses.add(byName(name));
    }
    return Future.wait(modelResponses).then(
      (value) => value.whereType<T>().toList(),
    );
  }

  Future<T?> byName(String name) async {
    final requestHash = "$resourcePath-$name";
    if (_simpleCache.containsKey(requestHash)) {
      return _simpleCache[requestHash] as T;
    }
    final uri = Uri.parse("").replace(
      pathSegments: <String>[
        resourcePath,
        name,
      ],
    );
    final response = await get(uri);
    final json = response.body;
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final result = mapResource(decoded);
    _simpleCache[requestHash] = result;
    return result;
  }

  Future<ApiResourceList<ApiResource>> resourceList({
    required int offset,
    required int limit,
  }) async {
    final response = await get(
      Uri.parse(resourcePath).replace(
        queryParameters: {
          'offset': offset.toString(),
          'limit': limit.toString(),
        },
      ),
    );
    final json = response.body;
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final jsonApiResources = decoded['results'] as List<dynamic>;
    final apiResources = jsonApiResources.map<ApiResource>(
      (e) => ApiResource(url: e['url']),
    );
    return ApiResourceList<ApiResource>(
      count: decoded['count'],
      next: decoded['next'],
      results: apiResources.toList(),
    );
  }
}
