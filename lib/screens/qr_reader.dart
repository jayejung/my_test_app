import 'dart:developer';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:my_test_app/constants/consts.dart';
import 'package:my_test_app/constants/labels.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrReaderScreen extends StatefulWidget {
  const QrReaderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRReaderScreenState();
}

class _QRReaderScreenState extends State<QrReaderScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? recognizedCode;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Labels.appBarTitleOfQrReader),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child:
                  (result != null) ? Text('Scan a code') : Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    //String? recognizedCode;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (recognizedCode == null) {
          result = scanData;
          recognizedCode = result!.code;
          //   log('listened: ${result}');
          //   log('restul!.format: ${describeEnum(result!.format)}');
          //   log('result!.code: ${result!.code}');
          //   final response = Navigator.pushNamed(context, Consts.qrVerifyRoute, arguments: {'qrData': recognizedCode});
          // }
          log('setStatus');
          _veryfyQr(context, recognizedCode);
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _veryfyQr(BuildContext context, String? recognizedCode) async {
    if (recognizedCode != null) {
      final response = await Navigator.pushNamed(context, Consts.qrVerifyRoute,
          arguments: {'qrData': recognizedCode});

      if (!mounted) return;

      recognizedCode = null;
      // ScaffoldMessenger.of(context).setState(() {
      //   recognizedCode = null;
      // });
      log('response: ${response}');
    }
  }
}