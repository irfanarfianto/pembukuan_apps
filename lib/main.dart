import 'dart:async';
import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/utils/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialApp(
        title: 'Kajar',
        theme: ThemeData(
          fontFamily: 'Arimo',
          scaffoldBackgroundColor: DesignSystem.blackColor,
          appBarTheme: AppBarTheme(
              backgroundColor: DesignSystem.blackColor,
              titleTextStyle: TextStyle(
                color: DesignSystem.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Melakukan delay untuk sementara sebelum pindah ke halaman utama
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Dashboard(title: 'Kajur')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Splash Screen',
              style: TextStyle(fontSize: 24),
            ),
            CircularProgressIndicator(), // Tambahkan animasi indikator loading jika perlu
          ],
        ),
      ),
    );
  }
}
