class RatingModel {
  var rate;
  final int count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonValue) {
    return RatingModel(
      rate: jsonValue['rate'],
      count: jsonValue['count'],
    );
  }
}
