import 'package:fine_dust_app/api_key.dart';
import 'package:fine_dust_app/model/air_result.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:fine_dust_app/main.dart';

/// var uri = Uri.https('example.org', '/path', {'q': 'dart'});
/// print(uri); // https://example.org/path?q=dart
///
/// uri = Uri.https('user:password@localhost:8080', '');
/// print(uri); // https://user:password@localhost:8080
///
/// uri = Uri.https('example.org', 'a b');
/// print(uri); // https://example.org/a%20b
///
/// uri = Uri.https('example.org', '/a%2F');
/// print(uri); // https://example.org/a%252F
/// ```
void main() {
  final apikey = ApiKey();
  test('http 통신 테스트', () async {
    var url =
        Uri.https('api.airvisual.com', '/v2/nearest_city', {'key': apikey.key});

    var response = await http.get(url);
    AirResult result = AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}
