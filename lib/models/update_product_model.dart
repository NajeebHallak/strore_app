class UpdateProductModel {
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;

  UpdateProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory UpdateProductModel.fromJson(json) {
    return UpdateProductModel(
      title: json["title"],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}
