import 'package:flutter/material.dart';
import 'package:store_app/pages/category_page.dart';

class CustomContainerCategory extends StatelessWidget {
  const CustomContainerCategory({
    super.key,
    required this.category,
    required this.image,
  });
  final dynamic category;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryPage.id, arguments: category);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15, top: 10),
        height: 135,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            '$category',
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
