import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> theData =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productModel = [];
    for (int i = 0; i < theData.length; i++) {
      productModel.add(
        ProductModel.fromJson(
          theData[i],
        ),
      );
    }
    print(productModel[0].price);
    return productModel;
  }
}
