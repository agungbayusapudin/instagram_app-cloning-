import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_cloning/model/uploadsModel.dart';
import 'package:instagram_cloning/service/uploadsService.dart';

class Uploadsmodelview extends ChangeNotifier {
  final Uploadsservice _uploadsservice = Uploadsservice();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Uploadsmodel> _uploadData = [];

  List<Map<String, dynamic>> _uploadByUser = [];

  List<Uploadsmodel> get upload => _uploadData;
  List<Map<String, dynamic>> get uploadByuser => _uploadByUser;

  // get uploads data from service
  void getUpload() async {
    try {
      _uploadData = await _uploadsservice.getUpload();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUploadAndUser() async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in");
      }
      String uid = user.uid;
      _uploadByUser = await _uploadsservice.uploadsByUser(uid);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
