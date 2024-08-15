class ProductModel {
  String? productImage;
  String? productName;
  String? productPrice;
  bool isFavourite = false;
  int quantity = 0;

  ProductModel(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.isFavourite,
      required this.quantity});
}
