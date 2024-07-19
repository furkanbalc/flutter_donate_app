import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';

class CategoriesModel extends CategoriesEntity {
  final List<CategoryModel>? categories;

  const CategoriesModel({required this.categories})
      : super(
    categories: categories,
  );

  CategoriesEntity convertToEntity() {
    return CategoriesEntity(categories: categories);
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories?.map((e) => e.toJson()).toList(),
    };
  }

  factory CategoriesModel.fromJson(Map<String, dynamic>? json) {
    return CategoriesModel(
      categories: json?['categories'] != null
          ? List<CategoryModel>.from(
          json!['categories'].map((e) => CategoryModel.fromJson(e)))
          : null,
    );
  }

  factory CategoriesModel.fromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return CategoriesModel(
      categories: snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList(),
    );
  }
}

class CategoryModel extends CategoryEntity {
  final String? id;
  final String? name;
  final String? image;

  const CategoryModel({
    this.id,
    this.name,
    this.image,
  }) : super(
    id: id,
    name: name,
    image: image,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
