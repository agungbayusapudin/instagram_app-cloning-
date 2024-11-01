import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_cloning/model/userModel.dart';

import 'package:instagram_cloning/service/userService.dart';

class Usermodelview extends ChangeNotifier {
  final Userservice _userservice = Userservice();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Usermodel> _userData = [];
  List<Usermodel> _userDataByUid = [];

  List<Usermodel> get userData => _userData;
  List<Usermodel> get userDataByUid => _userDataByUid;

  Future<void> getUser() async {
    try {
      _userData = await _userservice.getUser();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserByUid() async {
    try {
      final User? user = _auth.currentUser;

      if (user == null) {
        throw Exception("User not logged in");
      }
      String uid = user.uid;
      print(uid);
      _userDataByUid = await _userservice.getUserByUid(uid);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
