import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class CategriServices {
  Future<List<ProductModel>> getCatogeiPrudoct(
      {required String category_name}) async {
    List<dynamic> theData = await Api().get(
        url: 'https://fakestoreapi.com/products/category/${category_name}');
    List<ProductModel> productModel = [];
    for (int i = 0; i < theData.length; i++) {
      productModel.add(
        ProductModel.fromJson(
          theData[i],
        ),
      );
    }
    return productModel;
  }
}
