import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/add_prouct_service.dart';

import '../widgets/custom_Material_button.dart';
import '../widgets/custom_text_fild.dart';

class AddProductPage extends StatefulWidget {
  static String id = 'AddProductPage';

  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<AddProductPage> {
  String? title, image, desc, category;
  var price;

  bool isLoade = false;

  @override
  Widget build(BuildContext context) {
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
                  height: 10,
                ),
                CustomTextFild(
                  hintText: 'category',
                  onChanged: (value) {
                    category = value;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomMaterialButton(
                  text: 'ADD',
                  onPressed: () async {
                    setState(() {
                      isLoade = true;
                    });
                    print(
                        'title is$title , price is $price,desc is $desc ,image is$image , category is $category, ');
                    if (title == null ||
                        price == null ||
                        desc == null ||
                        image == null ||
                        category == null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Not added'),
                          content:
                              Text('Not added because some fields are empty'),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              icon: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      setState(() {
                        isLoade = false;
                      });
                    } else {
                      await getAddProductMethod(
                        title,
                        price,
                        desc,
                        image,
                        category,
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
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getAddProductMethod(String? category, String? title, var price,
      String? desc, String? image) async {
    await AddProductService().addProduct(
      title: title!,
      price: price!,
      description: desc!,
      image: image!,
      category: category!,
    );
  }
}
