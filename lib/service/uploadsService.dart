import 'package:instagram_cloning/model/uploadsModel.dart';
import 'package:instagram_cloning/repository/uploadsRepository.dart';
import 'package:instagram_cloning/repository/userRepository.dart';

class Uploadsservice {
  final Uploadsrepository _uploadsrepository = Uploadsrepository();
  final Userrepository _userrepository = Userrepository();

  Future<List<Uploadsmodel>> getUpload() async {
    return await _uploadsrepository.fetchData();
  }

  // get userUploads from repository
  Future<List<Map<String, dynamic>>> uploadsByUser(String uid) async {
    final users = await _userrepository.fetchUserByUid(uid);
    final posts = await _uploadsrepository.fetchUploadByUid(uid);

    List<Map<String, dynamic>> result = [];

    for (var user in users) {
      result.add({'source': 'users', 'data': user});
    }

    for (var post in posts) {
      result.add({'source': 'posts', 'data': post});
    }

    return result;
  }
}
