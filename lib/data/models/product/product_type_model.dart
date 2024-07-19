import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_donate_app/domain/entities/product/product_type_entity.dart';
class ProductTypesModel extends ProductTypesEntity {
  final List<ProductTypeModel>? types;

  const ProductTypesModel({required this.types}) : super(types: types);

  ProductTypesEntity convertToEntity() {
    return ProductTypesEntity(types: types);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': types?.map((e) => e.toJson()).toList(),
    };
  }

  factory ProductTypesModel.fromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return ProductTypesModel(
      types: snapshot.docs.map((doc) => ProductTypeModel.fromJson(doc.data())).toList(),
    );
  }
}
class ProductTypeModel extends ProductTypeEntity {
  final String id;
  final String type;

  ProductTypeModel({
    required this.id,
    required this.type,
  }) : super(
          id: id,
          type: type,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(
      id: json['id'],
      type: json['type'],
    );
  }
}
