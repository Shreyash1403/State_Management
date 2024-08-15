import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/models/product_model.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> listOfProducts = [];

  void addProductData({required ProductModel pObj}) {
    listOfProducts.add(pObj);
  }

  void addToFavourites({required int index}) {
    listOfProducts[index].isFavourite = !listOfProducts[index].isFavourite;
    notifyListeners();
  }

  void addQuantity({required int index}) {
    listOfProducts[index].quantity = listOfProducts[index].quantity + 1;
    notifyListeners();
  }

  void removeQuantity({required int index}) {
    listOfProducts[index].quantity = listOfProducts[index].quantity - 1;
    notifyListeners();
  }
}
