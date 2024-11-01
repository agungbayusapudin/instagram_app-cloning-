import 'package:instagram_cloning/model/uploadsModel.dart';
import 'package:instagram_cloning/model/userModel.dart';
import 'package:instagram_cloning/repository/uploadsRepository.dart';
import 'package:instagram_cloning/repository/userRepository.dart';

class Userservice {
  final Userrepository _userrepository = Userrepository();

  Future<List<Usermodel>> getUser() async {
    return await _userrepository.fetchData();
  }

  Future<List<Usermodel>> getUserByUid(String uid) async {
    return await _userrepository.fetchUserByUid(uid);
  }
}
