import 'package:flutter/material.dart';
import 'package:provider_demo_app/models/product_model.dart';

class ProductController with ChangeNotifier {
  ProductModel? productModelObj;

  void addProductData(ProductModel pObj) {
    productModelObj = pObj;
  }

  void addToFavorite() {
    productModelObj!.isFavourite = !productModelObj!.isFavourite!;
    notifyListeners();
  }

  void addQuantity() {
    productModelObj!.quantity = productModelObj!.quantity! + 1;
    notifyListeners();
  }

  void removeQuantity() {
    productModelObj!.quantity = productModelObj!.quantity! - 1;
    notifyListeners();
  }
}
