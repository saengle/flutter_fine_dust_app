import 'dart:async';
import 'dart:convert';

import 'package:fine_dust_app/api_key.dart';
import 'package:fine_dust_app/model/air_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AirResult? _result;
  final _apiKey = ApiKey();

  Future<AirResult> fetchData() async {
    var url = Uri.https(
        'api.airvisual.com', '/v2/nearest_city', {'key': _apiKey.key});

    var response = await http.get(url);
    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  @override
  void initState() {
    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('미세먼지 앱'),
      ),
      // ignore: unnecessary_null_comparison
      body: _result == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 220),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${_result!.data.city} 미세먼지',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        color: getColor(_result!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              '미세먼지 농도',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${_result!.data.current.pollution.aqius}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Text(
                              getWeatherStatus(_result!),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getIcon(_result!, getColor(_result!)),
                            Text('습도 ${_result!.data.current.weather.hu}%'),
                            Text('풍속 ${_result!.data.current.weather.ws}m/s'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            ),
    );
  }

  Color getColor(AirResult result) {
    Color resultColor = Colors.black;
    if (result.data.current.pollution.aqius <= 50) {
      return Colors.green;
    } else if (result.data.current.pollution.aqius <= 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius <= 150) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getWeatherStatus(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius <= 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius <= 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }

  Icon getIcon(AirResult result, Color resultColor) {
    if (result.data.current.pollution.aqius <= 50) {
      return Icon(
        Icons.sentiment_satisfied,
        color: resultColor,
        size: 40,
      );
    } else if (result.data.current.pollution.aqius <= 100) {
      return Icon(
        Icons.sentiment_satisfied,
        color: resultColor,
        size: 40,
      );
    } else if (result.data.current.pollution.aqius <= 150) {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: resultColor,
        size: 40,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: resultColor,
        size: 40,
      );
    }
  }
}
