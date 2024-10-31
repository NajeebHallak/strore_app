import 'dart:async';

import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/udate_product_services.dart';

import 'package:store_app/widgets/custom_text_fild.dart';

import '../widgets/custom_Material_button.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, image, desc;

  var price;

  bool isLoade = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoade,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomTextFild(
                  hintText: 'Product Name',
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFild(
                  hintText: 'description',
                  onChanged: (value) {
                    desc = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFild(
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                  onChanged: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFild(
                  hintText: 'Image',
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomMaterialButton(
                  text: 'Update',
                  onPressed: () async {
                    setState(() {
                      isLoade = true;
                    });
                    await getUpdateProductMethod(
                      title,
                      productModel,
                      price,
                      desc,
                      image,
                    );
                    try {
                      print('Success');
                    } catch (e) {
                      print('ERROR is $e');
                    }
                    setState(() {
                      isLoade = false;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getUpdateProductMethod(String? title, ProductModel productModel,
      var price, String? desc, String? image) async {
    await UdateServices().udateProduct(
      id: productModel.id,
      title: title ?? productModel.title,
      price: price ?? productModel.price.toString(),
      description: desc ?? productModel.description,
      image: image ?? productModel.image,
      category: productModel.category,
    );
  }
}
