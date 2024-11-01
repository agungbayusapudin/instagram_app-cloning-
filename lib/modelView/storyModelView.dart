import 'package:flutter/foundation.dart';
import 'package:instagram_cloning/model/storyModel.dart';
import 'package:instagram_cloning/service/storyService.dart';

class Storymodelview extends ChangeNotifier {
  final Storyservice _storyservice = Storyservice();

  List<Storymodel> _storyData = [];

  List<Storymodel> get story => _storyData;

  void getStory() async {
    try {
      _storyData = await _storyservice.getStoryData();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
