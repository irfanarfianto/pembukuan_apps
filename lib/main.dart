import 'package:flutter/material.dart';
import 'package:pembukuan_apps/screens/auth/login.dart';
import 'package:provider/provider.dart';
import '/utils/design_system.dart';
import 'services/api_manager.dart';
import 'services/user_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiManager apiManager = ApiManager(
      baseUrl:
          'http://10.10.24.16/flutter_pembukuan_apps/'); // Ganti URL sesuai kebutuhan Anda
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager()),
        Provider.value(value: apiManager),
      ],
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
              ),
              iconTheme: IconThemeData(
                color: DesignSystem.whiteColor,
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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        ),
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
