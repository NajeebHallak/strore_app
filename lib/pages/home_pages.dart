import 'package:flutter/material.dart';
import 'package:store_app/pages/add_product.dart';

import '../widgets/category_home.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titl: 'New Trend',
      ),
      body: const Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            CategoryHome(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 99,
              ),
            ),
            ProductHome(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
