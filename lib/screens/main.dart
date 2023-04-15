import 'package:flutter/material.dart';
import 'package:my_test_app/constants/consts.dart';
import 'package:my_test_app/constants/labels.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Labels.appBarTitleOfMainScreen),
        backgroundColor: const Color(Consts.mainColor),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(Labels.qrReaderLaunchButton),
          onPressed: () {
            Navigator.pushNamed(context, Consts.qrReaderRoute);
          },
        ),
      ),
    );
  }
}
