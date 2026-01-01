import 'package:pharma_ssist/models/sales_item_model.dart';

class SaleBillModel {
  final int id;
  final String pharmacistName;
  final String date;
  final List<SalesItemModel> salesItems;
  final num totalPriceOfBill;

  const SaleBillModel(
      {required this.id,
      required this.pharmacistName,
      required this.date,
      required this.salesItems,
      required this.totalPriceOfBill});

  factory SaleBillModel.fromJson(Map<String, dynamic> json) {
    return SaleBillModel(
      id: json[''],
      pharmacistName: json[''],
      date: json[''],
      salesItems: json[''],
      totalPriceOfBill: json[''],
    );
  }
}
