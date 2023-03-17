import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'qr_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MT QR CODE SCANNER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyScanner(),
    );
  }
}

class MyScanner extends StatefulWidget {
  const MyScanner({Key? key}) : super(key: key);

  @override
  State<MyScanner> createState() => _MyScannerState();
}

class _MyScannerState extends State<MyScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lotta QR Scanner'),
        ),
        body: Container(
          child: Column(
            children: [
              QrCamera(qrCodeCallback: (code) {
                print(code);
              }),

              const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRScanner()));
                  },
                  child: const Text('Scan QR Code') )
            ],
          ),
        )
    );
  }
}
