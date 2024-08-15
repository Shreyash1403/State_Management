import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/controllers/product_controller.dart';
import 'package:provider_demo_app/view/product_details.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProductController();
      },
      child: MaterialApp(
        title: "Product Details",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: GetProductDetails(),
      ),
    );
  }
}
