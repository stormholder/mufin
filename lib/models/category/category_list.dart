import 'package:mufin/models/category/category.dart';

class CategoryList {
  final List<Category>? categories;

  CategoryList({
    this.categories,
  });

  factory CategoryList.fromJson(List<dynamic> json) {
    List<Category> categories = <Category>[];
    categories = json.map((category) => Category.fromMap(category)).toList();

    return CategoryList(categories: categories);
  }
}