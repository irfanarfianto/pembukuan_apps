import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/api_manager.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _register(BuildContext context) async {
    final apiManager = Provider.of<ApiManager>(context, listen: false);

    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Validasi input
    if (validateInput(name, username, password)) {
      try {
        await apiManager.register(name, username, password);
        // Show a toast on successful registration
        _showSuccessSnackBar(context, 'Registration successful');
        // Handle successful registration
      } catch (e) {
        print('Registration failed. Error: $e');
        // Show error notification
        _showErrorSnackBar(context, 'Registration failed. Please try again.');
        // Handle registration failure
      }
    } else {
      _showErrorSnackBar(context, 'Please fill all fields.');
    }
  }

  bool validateInput(String name, String username, String password) {
    return name.isNotEmpty && username.isNotEmpty && password.isNotEmpty;
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
