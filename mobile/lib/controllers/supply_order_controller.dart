import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/helper/api.dart';
import 'package:pharma_ssist/models/supply_order_model.dart';

class SupplyOrderService{
  Future<List<SupplyOrderModel>> getSupplyOrderBills() async{
    final List<dynamic> data = await Api().get('$baseUrl/GetPharmacistPurchase', '');
    List<SupplyOrderModel> supplyOrders = [];

    for(var element in data){
      SupplyOrderModel supplyOrder = SupplyOrderModel.fromJson(element);
      supplyOrders.add(supplyOrder);
    }
    return supplyOrders;
  }
}
