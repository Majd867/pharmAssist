class CategoryModel{
  final String categoryName;

  const CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(json){
    return CategoryModel(
      categoryName: json['category_name'],
    );
  }
}