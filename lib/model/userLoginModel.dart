import 'package:cloud_firestore/cloud_firestore.dart';

class Userloginmodel {
  final String email;
  final String password;

  Userloginmodel({
    required this.email,
    required this.password,
  });

  // user model fromFirestore
  factory Userloginmodel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Userloginmodel(
      email: data['email'],
      password: data['password'],
    );
  }

  // digunakan untuk merubah data menjadi object agar bisa upload ke firestore
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }
}
