import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_product_services.dart';
import 'custom_grid_view_builder_car.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({
    super.key,
    this.category,
  });
  final dynamic category;
  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  // ignore: prefer_typing_uninitialized_variables
  var productModel;
  @override
  void initState() {
    super.initState();
    productModel = AllProductServices().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: productModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomGridViewBuilderCard(productModel: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('OOPS NO DATA TRY LATER'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 350,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
