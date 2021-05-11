
import 'package:sample_flutter_app/response_model.dart';
import 'package:sample_flutter_app/result.dart';
import 'package:sample_flutter_app/user_provider.dart';

class UserRepository{
  final _apiProvider = UserApiProvider();

  Future<Result<UserResponse,String>> getUser(){
    return _apiProvider.getUser();
  }
}