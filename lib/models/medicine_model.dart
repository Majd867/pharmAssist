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

    const MedicineModel(
        {required this.medicineID,
        required this.name,
        required this.category,
        required this.scientificName,
        required this.manufacturer,
        required this.price,
        required this.prescription,
        required this.productionDate,
        required this.expirationDate,
        required this.quantityInStock,
        required this.barCode});

    factory MedicineModel.fromJson(Map<String, dynamic> json) {
      return MedicineModel(
        medicineID: json['id'],
        name: json['name'],
        category: List<String>.from(json['categories'].map((cat) => cat.trim())),
        scientificName: json['sci_name'],
        manufacturer: json['Manufacturer'],
        price: json['price'],
        prescription: json['prescription'],
        productionDate: json['production_date'] ?? '',
        expirationDate: json['expiration_date'] ?? '',
        quantityInStock: json['quantity_in_stock'],
        barCode: json['barCode'] ?? '', // handle optional or missing barcode
      );
    }
  }
