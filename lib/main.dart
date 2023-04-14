import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My first App demo",
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/qrReader': (context) => QrReaderScreen(),
    }
  ));
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch Screen'),
          onPressed: () {
            // 클릭하면 두번째 화면으로 전환 합니다.
          },
        ),
      ),
    );
  }
}

class QrReaderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrReaderScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          child: Text('Go Back!'),
        ),
      ),
    );
  }
}
