import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

import '../models/update_product_model.dart';

class UdateServices {
  Future<UpdateProductModel> udateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    print('id   : $id');
    Map<String, dynamic> theData = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    UpdateProductModel updateProductModel =
        UpdateProductModel.fromJson(theData);
    return updateProductModel;
  }
}
