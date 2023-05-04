import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI();
});

abstract class IUserAPI {
  void saveUserData();
  // FutureEitherVoid saveUserData();
  // Future<Document> getUserData(String uid);
}

class UserAPI extends IUserAPI{
  @override
  // Future getUserData(String uid) {
  //   // TODO: implement getUserData
  //   throw UnimplementedError();
  // }

  @override
  // saveUserData(userModal) {
  //   // TODO: implement saveUserData
  //   throw UnimplementedError();
  // }


  
  @override
  void saveUserData() {
    
  }
  

}