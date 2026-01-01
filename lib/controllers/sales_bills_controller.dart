import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/helper/api.dart';
import 'package:pharma_ssist/models/sale_bill.dart';

class CustomerBillService{
  Future<List<SaleBillModel>> getSalesBills() async{
    final List<dynamic> data = await Api().get('$baseUrl/GetPharmacistSales', '');
    List<SaleBillModel> salesBills = [];

    for(var element in data){
      SaleBillModel saleBill = SaleBillModel.fromJson(element);
      salesBills.add(saleBill);
    }
    return salesBills;
  }
}
