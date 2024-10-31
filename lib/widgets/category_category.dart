import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/get_cagegory_services.dart';
import 'custom_grid_view_builder_car.dart';

class CategoryCategory extends StatefulWidget {
  const CategoryCategory({
    super.key,
    required this.category,
  });
  final dynamic category;
  @override
  State<CategoryCategory> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<CategoryCategory> {
  // ignore: prefer_typing_uninitialized_variables
  var categoryModel;
  @override
  void initState() {
    super.initState();
    categoryModel =
        CategriServices().getCatogeiPrudoct(category_name: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: categoryModel,
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
