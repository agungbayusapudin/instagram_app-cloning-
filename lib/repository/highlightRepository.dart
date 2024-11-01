import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_cloning/model/hightlightModel.dart';

class Highlightrepository {
  final CollectionReference _highLightCollection = FirebaseFirestore.instance
      .collection('instagram')
      .doc('data')
      .collection('highlight');

  Future<List<Highlightmodel>> fetchData() async {
    final QuerySnapshot snapshot = await _highLightCollection.get();

    return snapshot.docs
        .map((doc) => Highlightmodel.fromFirestore(doc))
        .toList();
  }
}
