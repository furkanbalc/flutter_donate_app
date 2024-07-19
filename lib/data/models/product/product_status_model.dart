import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_donate_app/domain/entities/product/product_status_entity.dart';
class ProductStatussModel extends ProductStatussEntity {
  final List<ProductStatusModel>? status;

  const ProductStatussModel({required this.status}) : super(status: status);

  ProductStatussEntity convertToEntity() {
    return ProductStatussEntity(status: status);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status?.map((e) => e.toJson()).toList(),
    };
  }

  factory ProductStatussModel.fromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return ProductStatussModel(
      status: snapshot.docs.map((doc) => ProductStatusModel.fromJson(doc.data())).toList(),
    );
  }
}
class ProductStatusModel extends ProductStatusEntity {
  final String id;
  final String status;

  const ProductStatusModel({
    required this.id,
    required this.status,
  }) : super(
          id: id,
          status: status,
        );

  ProductStatusEntity convertToEntity() {
    return ProductStatusEntity(
      id: id,
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }

  factory ProductStatusModel.fromJson(Map<String, dynamic> json) {
    return ProductStatusModel(
      id: json['id'],
      status: json['status'],
    );
  }
}
