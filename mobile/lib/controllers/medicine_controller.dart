import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/helper/api.dart';
import 'package:pharma_ssist/models/medicine_model.dart';

class MedicineService {
  Future<List<MedicineModel>> getMedicine(String category) async {
    final List<dynamic> data = await Api().get('$baseUrl/GetByCategoryName/$category', '');
    List<MedicineModel> medicineList = [];

    for (var element in data) {
      MedicineModel medicine = MedicineModel.fromJson(element);
      medicineList.add(medicine);
    }
    return medicineList;
  }
}

//final List<MedicineModel> medicineList = (response.data as List)
//     .map((e) => MedicineModel.fromJson(e))
//     .toList();
