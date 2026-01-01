import 'package:pharma_ssist/models/medicine_model.dart';

class SalesItemModel{
  final MedicineModel medicine;
  final int quantitySold;
  final num price;
  final num totalPrice;


  const SalesItemModel({
    required this.medicine,
    required this.quantitySold,
    required this.price,
    required this.totalPrice
  });
}