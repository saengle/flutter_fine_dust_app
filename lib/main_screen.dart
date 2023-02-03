import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('미세먼지 앱'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 220),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      height: 70,
                      color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('이모티콘'),
                          Text(
                            '80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Text(
                            '보통',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('이미지'),
                        Text('습도 : 100%'),
                        Text('풍속 3.7m/s'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ));
  }
}
