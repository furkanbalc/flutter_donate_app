import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final List<ProductEntity>? products;

  const ProductsEntity({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? categoryId;
  final String? typeId;
  final String? statusId;
  final String? rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.typeId,
    required this.statusId,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        categoryId,
        typeId,
        statusId,
        rating,
      ];
}
