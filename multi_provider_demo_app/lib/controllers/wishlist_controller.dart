import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/models/product_model.dart';
import 'dart:developer';

class WishListController with ChangeNotifier {
  List<ProductModel> listOfWishlistProducts = [];

  void addDataToWishlist({ProductModel? obj}) {
    listOfWishlistProducts.add(obj!);
    log("Product added to WishList");
  }

  void removeWishlist(int index) {
    listOfWishlistProducts.removeAt(index);
    notifyListeners();
  }
}
