import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
class ProductsModel extends ProductsEntity {
  final List<ProductModel>? products;

  const ProductsModel({required this.products}) : super(products: products);

  ProductsEntity convertToEntity() {
    return ProductsEntity(products: products);
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }

  factory ProductsModel.fromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return ProductsModel(
      products: snapshot.docs.map((doc) => ProductModel.fromJson(doc.data())).toList(),
    );
  }
}
class ProductModel extends ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? categoryId;
  final String? typeId;
  final String? statusId;
  final String? rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.typeId,
    required this.statusId,
    required this.rating,
  }) : super(
          id: id,
          title: title,
          description: description,
          categoryId: categoryId,
          typeId: typeId,
          statusId: statusId,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        categoryId: json["categoryId"],
        typeId: json["typeId"],
        statusId: json["statusId"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "categoryId": categoryId,
        "typeId": typeId,
        "statusId": statusId,
        "rating": rating,
      };
}
