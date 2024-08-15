import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/controllers/wishlist_controller.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishlistObj = Provider.of<WishListController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Consumer<WishListController>(
        builder: (context, controller, child) {
          if (wishlistObj.listOfWishlistProducts.isEmpty) {
            return const Center(
              child: Text('Your wishlist is empty'),
            );
          }

          return ListView.builder(
            itemCount: wishlistObj.listOfWishlistProducts.length,
            itemBuilder: (context, index) {
              var item = wishlistObj.listOfWishlistProducts[index];

              return ListTile(
                leading: Image.network('${item.productImage}'),
                title: Text('${item.productName}'),
                subtitle: Text('\$${item.productPrice}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Remove item from wishlist
                    //  controller.removeWishlist('${item}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
