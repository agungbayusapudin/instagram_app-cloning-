import 'package:cloud_firestore/cloud_firestore.dart';

class Storymodel {
  final String url;
  final String coments;

  Storymodel({required this.coments, required this.url});

  factory Storymodel.fromFiresotre(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Storymodel(coments: data['coments'], url: data['url']);
  }

  Map<String, dynamic> toMap() {
    return {'url': url, 'coments': coments};
  }
}
