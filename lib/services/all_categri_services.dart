import 'package:store_app/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> theData =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return theData;
  }
}
//dynamic