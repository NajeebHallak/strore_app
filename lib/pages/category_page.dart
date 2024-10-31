import 'package:flutter/material.dart';
import 'package:store_app/widgets/category_category.dart';
import 'package:store_app/widgets/custom_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  static String id = 'CategoryPage';
  @override
  Widget build(BuildContext context) {
    dynamic ctegory = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: CustomAppBar(
        titl: ctegory.toString(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 120),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            CategoryCategory(
              category: ctegory,
            ),
          ],
        ),
      ),
    );
  }
}
