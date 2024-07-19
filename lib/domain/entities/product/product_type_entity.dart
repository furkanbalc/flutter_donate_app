import 'package:equatable/equatable.dart';

class ProductTypesEntity extends Equatable {
  final List<ProductTypeEntity>? types;

  const ProductTypesEntity({required this.types});

  @override
  List<Object?> get props => [types];
}

class ProductTypeEntity extends Equatable {
  final String id;
  final String type;

  const ProductTypeEntity({
    required this.id,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        type,
      ];
}
