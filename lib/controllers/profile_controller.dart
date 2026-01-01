import 'package:pharma_ssist/models/user_profile_model.dart';
import '../helper/info_storage.dart';
import '../helper/api.dart';

class ProfileController {

  Future<UserProfileModel> getProfile() async {
    final session = SessionManager();
    String? token = session.token;

    if (token == null) {
      throw Exception('Token not found. Please login again.');
    }

    final Map<String, dynamic> data = await Api().get(
      'http://10.0.2.2:8000/api/PharmacistProfile',
      token,
    );

    return UserProfileModel.fromJson(data);
  }
}
