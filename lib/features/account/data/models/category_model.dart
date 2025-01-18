import 'package:risha_app/config/json_constants.dart';

class CategoryModel {
  final int id;
  final String? arTitle;
  final String? enTitle;
  final String? icon;
  final String? hexColor;
  final bool? isFavorite;

  CategoryModel({
    required this.id,
    this.arTitle,
    this.enTitle,
    this.icon,
    this.hexColor,
    this.isFavorite,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json[CategoriesJsonConstants.id],
      arTitle: json[CategoriesJsonConstants.arTitle] ?? "",
      enTitle: json[CategoriesJsonConstants.enTitle] ?? "",
      icon: json[CategoriesJsonConstants.icon] ?? "",
      hexColor: json[CategoriesJsonConstants.hexColor] ?? "#6949FF",
      isFavorite: json[CategoriesJsonConstants.isFavorite] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoriesJsonConstants.id: id,
      CategoriesJsonConstants.arTitle: arTitle,
      CategoriesJsonConstants.enTitle: enTitle,
      CategoriesJsonConstants.icon: icon,
      CategoriesJsonConstants.hexColor: hexColor,
      CategoriesJsonConstants.isFavorite: isFavorite,
    };
  }
}
