import 'package:pharma_ssist/models/date_model.dart';

class SupplyOrderModel {
  final int orderID;
  final String salesRepresentative;
  final String wareHouseName;
  final DateModel purchaseDate;
  final num totalPrice;

  const SupplyOrderModel(
      {required this.orderID,
      required this.salesRepresentative,
      required this.wareHouseName,
      required this.purchaseDate,
      required this.totalPrice});

  factory SupplyOrderModel.fromJson(Map<String, dynamic> json) {
    return SupplyOrderModel(
      orderID: json[''],
      salesRepresentative: json[''],
      wareHouseName: json[''],
      purchaseDate: json[''],
      totalPrice: json[''],
    );
  }
}
