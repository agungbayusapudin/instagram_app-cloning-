import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_cloning/repository/userRepository.dart';

class Loginmodelview extends ChangeNotifier {
  final Userrepository _userrepository = Userrepository();

  bool _isLoading = false;

  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _errorMessage = 'Email and password cannot be empty';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      UserCredential userCredential =
          (await _userrepository.loginEmailAndPassword(email, password));
      print("User  signed in: ${userCredential.user?.uid}");
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
