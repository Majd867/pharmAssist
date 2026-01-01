import 'package:pharma_ssist/controllers/medicine_controller.dart';
import 'package:pharma_ssist/models/medicine_model.dart';

class InventoryLogicController {
  String selectedCategory = 'All';
  List<MedicineModel> medicineList = [];

  Future<List<MedicineModel>> fetchMedicines(String category) async {
    selectedCategory = category;
    medicineList = await MedicineService().getMedicine(category);
    return medicineList;
  }
}
