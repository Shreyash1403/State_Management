class ProductModel {
  String? productImage;
  String? productName;
  String? price;
  bool? isFavourite = false;
  int? quantity = 0;

  ProductModel(
      {this.productImage,
      this.productName,
      this.price,
      this.isFavourite,
      this.quantity});
}
