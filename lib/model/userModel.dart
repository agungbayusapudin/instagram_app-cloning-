import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String username;
  final String email;
  final String img;
  final String uid;

  Usermodel(
      {required this.email,
      required this.username,
      required this.img,
      required this.uid});

  // user model fromFirestore
  factory Usermodel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Usermodel(
        email: data['email'],
        username: data['username'],
        img: data['img'],
        uid: data['uid']);
  }

  // digunakan untuk merubah data menjadi object agar bisa upload ke firestore
  Map<String, dynamic> toMap() {
    return {'username': username, 'email': email, 'img': img, 'uid': uid};
  }
}
