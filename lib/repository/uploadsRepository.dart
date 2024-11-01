import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:instagram_cloning/model/uploadsModel.dart';

class Uploadsrepository {
  final CollectionReference _uploadCollection = FirebaseFirestore.instance
      .collection('instagram')
      .doc('data')
      .collection('uploads');

  // get data from firebase
  Future<List<Uploadsmodel>> fetchData() async {
    final QuerySnapshot snapshot = await _uploadCollection.get();

    return snapshot.docs.map((doc) => Uploadsmodel.fromFirestore(doc)).toList();
  }

  Future<List<Uploadsmodel>> fetchUploadByUid(String uid) async {
    final QuerySnapshot snapshot =
        await _uploadCollection.where('uid', isEqualTo: uid).get();

    return snapshot.docs.map((doc) => Uploadsmodel.fromFirestore(doc)).toList();
  }

  // untuk upload file dalam storage firbase
  Future<String?> uploadFile(File file) async {
    try {
      String fileName = file.path.split('/').last;

      Reference storageRef =
          FirebaseStorage.instance.ref().child('upload/$fileName');

      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
