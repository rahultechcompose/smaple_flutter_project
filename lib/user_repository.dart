import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/user_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}