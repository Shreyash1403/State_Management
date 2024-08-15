import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/controllers/product_controller.dart';
import 'package:multi_provider_demo_app/controllers/wishlist_controller.dart';
import 'package:multi_provider_demo_app/view/wishlist_screen.dart';
import 'package:provider/provider.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const WishListScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.red,
            ),
          ),
        ],
        title: const Text("Products List Screen"),
      ),
      body: ListView.builder(
        itemCount: providerObj.listOfProducts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Image.network(
                    "${providerObj.listOfProducts[index].productImage}"),
                const SizedBox(height: 10),
                Text("${providerObj.listOfProducts[index].productName}"),
                const SizedBox(height: 10),
                Text("${providerObj.listOfProducts[index].productPrice}"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// IS FAVORITE
                    Consumer<ProductController>(
                      builder: (context, provider, child) {
                        log("IN FAV CONSUMER");
                        return GestureDetector(
                          onTap: () {
                            /// ADD PRODUCT TO WISHLIST
                            providerObj.addToFavourites(index: index);

                            if (providerObj.listOfProducts[index].isFavourite) {
                              Provider.of<WishListController>(context,
                                      listen: false)
                                  .addDataToWishlist(
                                      obj: providerObj.listOfProducts[index]);
                            }
                          },
                          child: Icon(
                            (providerObj.listOfProducts[index].isFavourite)
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            providerObj.addQuantity(index: index);
                          },
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                        const SizedBox(width: 5),

                        ///QUANTITY
                        Consumer<ProductController>(
                          builder: (context, value, child) {
                            log("IN QUANTITY");
                            return Text(
                                "${providerObj.listOfProducts[index].quantity}");
                          },
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            providerObj.removeQuantity(index: index);
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
