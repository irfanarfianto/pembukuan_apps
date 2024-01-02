import 'package:flutter/material.dart';
import 'package:pembukuan_apps/screens/auth/register.dart';
import 'package:pembukuan_apps/screens/home.dart';
import 'package:provider/provider.dart';
import '../../services/api_manager.dart';
import '../../services/user_manager.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _authenticate(BuildContext context) async {
    final apiManager = Provider.of<ApiManager>(context, listen: false);
    final userManager = Provider.of<UserManager>(context, listen: false);

    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      // Panggil metode untuk melakukan autentikasi dengan data ke backend
      final token = await apiManager.authenticate(username, password);

      // Cek apakah autentikasi berhasil (mendapatkan token)
      if (token != null) {
        userManager.setAuthToken(token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(title: "Kajur"),
          ),
        );
      } else {
        // Autentikasi gagal, tampilkan pesan kesalahan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid credentials. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Authentication failed. Error: $e');
      // Tampilkan pesan kesalahan autentikasi kepada pengguna
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _authenticate(context),
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
