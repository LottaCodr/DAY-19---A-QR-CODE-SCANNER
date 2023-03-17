import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController? _controller;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),

      body: Column(
        children: [
          Expanded(
            flex: 5,
              child: QRView(
                  key: _qrKey,
                  onQRViewCreated: _onQRViewCreated,
              ),
          ),
          const Expanded(
            flex: 1,
              child: Center(
                child: Text('Scan a QR code'),
              ))
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    _controller?.scannedDataStream.listen((scanData) {
      //handle scanned data here
    });
  }
  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }
}

