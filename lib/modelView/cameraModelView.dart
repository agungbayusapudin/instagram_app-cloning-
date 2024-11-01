import 'dart:io';

import 'package:flutter/material.dart';

import 'package:instagram_cloning/repository/uploadsRepository.dart';

class Cameramodelview extends ChangeNotifier {
  final Uploadsrepository _uploadsrepository = Uploadsrepository();

  String? downladUrl;

  bool isLoading = false;

  Future<void> getDownloadUrl(File file) async {
    isLoading = true;
    notifyListeners();

    downladUrl = await _uploadsrepository.uploadFile(file);

    isLoading = false;
    notifyListeners();
  }
}
