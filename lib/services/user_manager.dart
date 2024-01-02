import 'package:flutter/foundation.dart';

class UserManager extends ChangeNotifier {
  String? authToken;

  get currentUser => null;

  void setAuthToken(String? token) {
    authToken = token;
    notifyListeners();
  }

  bool get isAuthenticated => authToken != null;
}
