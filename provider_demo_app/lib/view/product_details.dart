import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/controllers/product_controller.dart';
import 'package:provider_demo_app/models/product_model.dart';
import 'package:provider_demo_app/view/product_display.dart';

class GetProductDetails extends StatelessWidget {
  GetProductDetails({super.key});

  final TextEditingController _productImageEditingController =
      TextEditingController();
  final TextEditingController _productNameEditingController =
      TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET PRODUCT DETAILS"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _productImageEditingController,
            decoration: InputDecoration(
              hintText: "Add Product Image",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _productNameEditingController,
            decoration: InputDecoration(
              hintText: "Add Product Name",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _priceEditingController,
            decoration: InputDecoration(
              hintText: "Add Product Price",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              var tempObj = ProductModel(
                isFavourite: false,
                price: _priceEditingController.text.trim(),
                //     productImage: _productImageEditingController.text.trim(),
                productImage: 'https://via.placeholder.com/150',

                productName: _productNameEditingController.text.trim(),
                quantity: 0,
              );

              Provider.of<ProductController>(context, listen: false)
                  .addProductData(tempObj);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProductDisplay();
              }));
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
