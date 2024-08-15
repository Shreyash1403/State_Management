import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/controllers/product_controller.dart';
import 'package:multi_provider_demo_app/models/product_model.dart';
import 'package:multi_provider_demo_app/view/display_product_details.dart';
import 'package:provider/provider.dart';

class GetProductDetails extends StatefulWidget {
  const GetProductDetails({super.key});

  @override
  State<GetProductDetails> createState() => _GetProductDetailsState();
}

class _GetProductDetailsState extends State<GetProductDetails> {
  final TextEditingController _productNameTextEditingController =
      TextEditingController();
  final TextEditingController _productImageTextEditingController =
      TextEditingController();
  final TextEditingController _productPriceTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GET PRODUCT DETAILS"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _productImageTextEditingController,
            decoration: InputDecoration(
              hintText: "Add Image",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// PRODUCT NAME
          TextFormField(
            controller: _productNameTextEditingController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// PRODUCT PRICE
          TextFormField(
            controller: _productPriceTextEditingController,
            decoration: InputDecoration(
              hintText: "Enter Price",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          ElevatedButton(
              onPressed: () {
                var obj = ProductModel(
                    productImage:
                        _productImageTextEditingController.text.trim(),
                    productName: _productNameTextEditingController.text.trim(),
                    productPrice:
                        _productPriceTextEditingController.text.trim(),
                    isFavourite: false,
                    quantity: 0);

                Provider.of<ProductController>(context, listen: false)
                    .addProductData(pObj: obj);

                _productImageTextEditingController.clear();
                _productNameTextEditingController.clear();
                _productPriceTextEditingController.clear();
              },
              child: const Text("Add")),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProductsListScreen();
              }));
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
