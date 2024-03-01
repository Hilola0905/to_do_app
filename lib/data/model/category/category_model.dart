
import 'dart:ui';

import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/utility_function.dart';

import 'category_model_constants.dart';

class CategoryModel {
  final int? id;
  final String name;
  final String iconPath;
  final Color color;

  CategoryModel({
    this.id,
    required this.iconPath,
    required this.name,
    required this.color,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? iconPath,
    Color? color,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      iconPath: json[CategoryModelConstants.iconPath] as String? ?? "",
      name: json[CategoryModelConstants.name] as String? ?? "",
      color:((json[CategoryModelConstants.color] as String ?? "")).toColor() ?? AppColors.white,
      id: json[CategoryModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CategoryModelConstants.name: name,
      CategoryModelConstants.iconPath: iconPath,
      CategoryModelConstants.color: color,
    };
  }

  bool canAddCategoryToDatabase() {
    if (name.isEmpty) return false;
    if (iconPath.isEmpty) return false;
   // if (color==null) return false;
    return true;
  }

  static CategoryModel initialValue = CategoryModel(
    iconPath: "",
    name: "",
    color: AppColors.white,
  );
}
