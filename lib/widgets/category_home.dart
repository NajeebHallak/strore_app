import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/all_categri_services.dart';
import 'list_view_category.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({
    super.key,
  });

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  var listCategory;
  @override
  void initState() {
    super.initState();
    listCategory = AllCategoriesServices().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: listCategory,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListViewCategory(
            listCategory: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'OOPS NO DATA',
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
