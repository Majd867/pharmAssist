import 'package:pharma_ssist/helper/api.dart';
import 'package:pharma_ssist/models/user_login_model.dart';

class LoginService {
  Future<dynamic> login(UserLoginModel request) async {
    final response = await Api().post(
      url: 'http://10.0.2.2:8000/api/Login',
      body: request.toJson(),
    );
    return response;
  }
}
