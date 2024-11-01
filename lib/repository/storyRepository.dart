import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_cloning/model/storyModel.dart';

class Storyrepository {
  final CollectionReference _storyCollection = FirebaseFirestore.instance
      .collection('instagram')
      .doc('data')
      .collection('story');

  Future<List<Storymodel>> getStory() async {
    final QuerySnapshot snapshot = await _storyCollection.get();

    return snapshot.docs.map((doc) => Storymodel.fromFiresotre(doc)).toList();
  }
}
