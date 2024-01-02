import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/user_manager.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan data pengguna dari UserManager menggunakan Provider
    final userManager = Provider.of<UserManager>(context, listen: false);
    final user = userManager.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Profile'),
      ])),
    );
  }
}
