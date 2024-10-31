import 'package:flutter/material.dart';
import 'package:store_app/pages/add_product.dart';
import 'package:store_app/pages/category_page.dart';

import 'package:store_app/pages/home_pages.dart';
import 'package:store_app/pages/update_product_page.dart';

void main() async {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        CategoryPage.id: (context) => const CategoryPage(),
        AddProductPage.id: (context) => const AddProductPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.id,
    );
  }
}
