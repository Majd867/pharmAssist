import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/helper/api.dart';
import 'package:pharma_ssist/models/pharmacist_model.dart';

class PharmacistController {
  Future<dynamic> pharmacistRegisterService(
      PharmacistModel pharmacistInfo) async {
    final response = await Api().post(
      url: '$baseUrl/RegisterPharmasict',
      body: pharmacistInfo.toJson(),
    );

    return response;
  }
}
