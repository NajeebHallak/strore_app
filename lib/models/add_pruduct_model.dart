class AddProductModel {
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;

  AddProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory AddProductModel.fromJson(json) {
    return AddProductModel(
      title: json["title"],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}
