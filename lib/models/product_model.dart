import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(jsonValue) {
    return ProductModel(
      id: jsonValue['id'],
      title: jsonValue['title'],
      price: jsonValue['price'],
      description: jsonValue['description'],
      category: jsonValue['category'],
      image: jsonValue['image'],
      rating: RatingModel.fromJson(jsonValue['rating']),
    );
  }
}
