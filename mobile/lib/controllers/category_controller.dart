import 'package:pharma_ssist/models/category_model.dart';
import '../constants.dart';
import '../helper/api.dart';


class CategoryService {
  Future<List<CategoryModel>> getCategories() async {
    List<dynamic> data = await Api().get('$baseUrl/GetAllCategories', '');
    List<CategoryModel> categoryList = [];

    for (var element in data) {
      CategoryModel category = CategoryModel.fromJson(element);
      categoryList.add(category);
    }
    return categoryList;
  }
}
