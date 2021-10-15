import 'package:flutter/cupertino.dart';
import 'package:provider_exemple/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  void addProduct(ProductModel product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }

  void clearList() {
    products.clear();
    notifyListeners();
  }
}
