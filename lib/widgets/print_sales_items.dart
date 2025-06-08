import 'package:pharma_ssist/models/sales_item_model.dart';

class PrintSalesItems{
  final List<SalesItemModel> salesItems;
  PrintSalesItems({required this.salesItems});
  static String getSalesItems(List<SalesItemModel> salesItems) {
    return salesItems.map((item) {
      return 'Name: ${item.medicine.name}\n'
          ' Quantity: ${item.quantitySold}\n'
          ' Price: ${item.price}\n'
          'Total price: ${item.totalPrice}\n'
          '____________________________';
    }).join('\n');
  }
}