import 'package:cloud_firestore/cloud_firestore.dart';

class Uploadsmodel {
  final String url;
  final int like;
  final String coments;
  final int send;
  final Timestamp tanggal;
  final String user;
  final String hastag;
  final String uid;

  Uploadsmodel(
      {required this.coments,
      required this.like,
      required this.send,
      required this.url,
      required this.hastag,
      required this.tanggal,
      required this.user,
      required this.uid});

  // uploads model from firestore
  factory Uploadsmodel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Uploadsmodel(
        coments: data['coments'],
        like: data['like'],
        send: data['send'],
        url: data['url'],
        hastag: data['hastag'],
        tanggal: data['tanggal'],
        user: data['user'],
        uid: data['uid']);
  }

  // change to object for upload in firestore
  Map<String, dynamic> toMap() {
    return {'coments': coments, 'like': like, 'send': send, 'url': url};
  }
}
