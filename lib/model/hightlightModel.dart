import 'package:cloud_firestore/cloud_firestore.dart';

class Highlightmodel {
  final String username;
  final String url;
  final Timestamp tanggal;
  final String name;

  Highlightmodel(
      {required this.tanggal,
      required this.url,
      required this.username,
      required this.name});

  factory Highlightmodel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Highlightmodel(
        tanggal: data['tanggal'],
        url: data['url'],
        username: data['username'],
        name: data['name']);
  }

  Map<String, dynamic> toMap() {
    return {'url': url, 'username': username, 'tanggal': tanggal, 'name': name};
  }
}
