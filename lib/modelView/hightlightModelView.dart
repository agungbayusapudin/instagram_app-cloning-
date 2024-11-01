import 'package:flutter/material.dart';
import 'package:instagram_cloning/model/hightlightModel.dart';
import 'package:instagram_cloning/service/hightlightService.dart';

class Hightlightmodelview extends ChangeNotifier {
  final Hightlightservice _hightlightservice = Hightlightservice();

  List<Highlightmodel> _highlightData = [];

  List<Highlightmodel> get highlightData => _highlightData;

  void fetchHighlight() async {
    try {
      _highlightData = await _hightlightservice.fetchData();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
