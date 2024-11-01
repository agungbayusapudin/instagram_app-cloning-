import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_cloning/model/userLoginModel.dart';
import 'package:instagram_cloning/model/userModel.dart';

class Userrepository {
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection('instagram')
      .doc('data')
      .collection('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // mengambil user semuanya
  Future<List<Usermodel>> fetchData() async {
    final QuerySnapshot snapshot = await _userCollection.get();

    return snapshot.docs.map((doc) => Usermodel.fromFirestore(doc)).toList();
  }

  // user berdasarkan nama
  Future<List<Usermodel>> fetchUserByUid(String uid) async {
    final QuerySnapshot snapshot =
        await _userCollection.where('uid', isEqualTo: uid).get();

    return snapshot.docs.map((doc) => Usermodel.fromFirestore(doc)).toList();
  }

  // memasukan data ke dalam firebase untuk user yang berhasil login
  Future<DocumentReference<Object?>> addUser(String email, String uid) async {
    return await _userCollection.add({'email': email, 'uid': uid});
  }

  // login user menggunakan firebase
  Future<UserCredential> loginEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // logout menggunkan firebse
  Future<void> logOut() async {
    await _auth.signOut();
  }
}
