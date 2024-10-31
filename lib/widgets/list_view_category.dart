import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_contaainer_category.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({super.key, required this.listCategory});
  final List<dynamic> listCategory;
  @override
  Widget build(BuildContext context) {
    List<String> listimage = [
      'assets/images/electronics.jpg',
      'assets/images/jj.jpg',
      'assets/images/men clothes.jpg',
      'assets/images/women clothes.jpg'
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 135,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listCategory.length,
          itemBuilder: (context, index) => CustomContainerCategory(
            category: listCategory[index],
            image: listimage[index],
          ),
        ),
      ),
    );
  }
}
