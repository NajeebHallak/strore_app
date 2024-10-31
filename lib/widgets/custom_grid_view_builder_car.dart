import 'package:flutter/widgets.dart';

import '../models/product_model.dart';
import 'custom_card.dart';

class CustomGridViewBuilderCard extends StatelessWidget {
  const CustomGridViewBuilderCard({
    super.key,
    required this.productModel,
  });

  final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 30,
        mainAxisSpacing: 150,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ClipRect(
          clipBehavior: Clip.none,
          child: CustomCard(
            productModel: productModel[index],
          ),
        ),
        childCount: productModel.length,
      ),
    );
  }
}
//clipBehavior: Clip.none,
