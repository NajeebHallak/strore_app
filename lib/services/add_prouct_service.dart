import 'package:store_app/helper/api.dart';
import 'package:store_app/models/add_pruduct_model.dart';

class AddProductService {
  Future<AddProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> theData = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );

    return AddProductModel.fromJson(theData);
  }
}
