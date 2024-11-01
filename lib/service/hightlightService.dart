import 'package:instagram_cloning/model/hightlightModel.dart';
import 'package:instagram_cloning/repository/highlightRepository.dart';

class Hightlightservice {
  final Highlightrepository _highlightrepository = Highlightrepository();

  Future<List<Highlightmodel>> fetchData() async {
    return await _highlightrepository.fetchData();
  }
}
