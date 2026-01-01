import 'package:pharma_ssist/models/pharmacist_model.dart';
import '../constants.dart';
import '../helper/api.dart';

class GetAllPharmacistsService {

  Future<List<PharmacistModel>> getAllPharmacists() async {
    final List<dynamic> data = await Api().get('$baseUrl/getAllPharmacists', '');
    List<PharmacistModel> pharmacistsList = [];

    for (var element in data) {
      PharmacistModel pharmacist = PharmacistModel.fromJson(element);
      pharmacistsList.add(pharmacist);
    }
    return pharmacistsList;
  }
}
