import 'package:flutter/material.dart';

import 'package:store_app/models/product_model.dart';

import 'package:store_app/pages/update_product_page.dart';
import 'package:store_app/widgets/love_icon_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,
            arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: -4,
                blurRadius: 10,
                offset: const Offset(10, 10),
              ),
            ]),
            // height: 150,
            // width: 250,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0, 6),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${productModel.price} ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        LoveIconeButton()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 75,
            bottom: 80,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
