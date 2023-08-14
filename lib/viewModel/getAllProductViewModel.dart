import 'package:flutter/foundation.dart';
import 'package:kon_app/data/service/service.dart';

class GetAllProductViewModel extends ChangeNotifier {
  GetAllProductViewModel() {
    getAllProduct();
  }

  ApiService apiService = ApiService();
  var progress = false;
  List products = [];

  getAllProduct() async {
    progress = true;
    products = await apiService.fetchAllProducts();
    print("===================================================================$products");
    progress = false;
  }
}
