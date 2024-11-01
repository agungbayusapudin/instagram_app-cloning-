import 'package:instagram_cloning/model/storyModel.dart';
import 'package:instagram_cloning/repository/storyRepository.dart';

class Storyservice {
  final Storyrepository _storyrepository = Storyrepository();

  Future<List<Storymodel>> getStoryData() async {
    return (await _storyrepository.getStory()).cast<Storymodel>();
  }
}
