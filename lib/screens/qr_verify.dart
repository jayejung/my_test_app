import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_test_app/constants/consts.dart';
import 'package:my_test_app/constants/labels.dart';

class QrVerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    log('argument: ${arguments}');

    return Scaffold(
      appBar: AppBar(
        title: const Text(Labels.appBarTitleOfQrVerify),
        backgroundColor: const Color(Consts.mainColor),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(Labels.returnToQrReaderScreenButton),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
