import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/controllers/product_controller.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("PRODUCT DISPLAY  "),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.network(
              ("${providerObj.productModelObj?.productImage}"),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("${providerObj.productModelObj?.productName}"),
            const SizedBox(
              height: 15,
            ),
            Text("${providerObj.productModelObj?.price}"),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Consumer<ProductController>(
                    builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      providerObj.addToFavorite();
                    },
                    child: Icon((providerObj.productModelObj!.isFavourite!)
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded),
                  );
                }),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        providerObj.addQuantity();
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Consumer<ProductController>(
                      builder: ((context, value, child) {
                        return Text(
                            "${providerObj.productModelObj!.quantity!}");
                      }),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        providerObj.removeQuantity();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
