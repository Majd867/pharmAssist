class MedicineModel {
  final int medicineID;
  final String name;
  final List<String> category;
  final String scientificName;
  final String manufacturer;
  final num price;
  final String prescription;
  final String productionDate;
  final String expirationDate;
  final int quantityInStock;
  final String barCode;

  const MedicineModel({
    required this.medicineID,
    required this.name,
    required this.category,
    required this.scientificName,
    required this.manufacturer,
    required this.price,
    required this.prescription,
    required this.productionDate,
    required this.expirationDate,
    required this.quantityInStock,
    required this.barCode,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      medicineID: json['id'],
      name: json['name'] ?? '',
      category: (json['categories'] as List)
          .expand((catList) =>
          (catList as List).map((cat) => cat.toString().trim()))
          .toList(),
      scientificName: json['sci_name'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      price: json['price'] ?? 0,
      prescription: json['prescription'] ?? '',
      productionDate: json['production_Date'] ?? '',
      expirationDate: json['expiration_Date'] ?? '',
      quantityInStock: json['quantity_in_stock'] ?? 0,
      barCode: json['barcode'] ?? '',
    );
  }
}


// category: List<String>.from(json['categories'].map((cat) => cat.trim())),
