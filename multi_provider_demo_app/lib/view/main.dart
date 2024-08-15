import 'package:flutter/material.dart';
import 'package:multi_provider_demo_app/controllers/product_controller.dart';
import 'package:multi_provider_demo_app/controllers/wishlist_controller.dart';
import 'package:multi_provider_demo_app/view/get_product_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return ProductController();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return WishListController();
        }),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: GetProductDetails(),
        );
      },
    );
  }
}
