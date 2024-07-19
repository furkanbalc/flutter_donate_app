import 'package:equatable/equatable.dart';

class ProductStatussEntity extends Equatable {
  final List<ProductStatusEntity>? status;

  const ProductStatussEntity({required this.status});

  @override
  List<Object?> get props => [status];
}

class ProductStatusEntity extends Equatable {
  final String id;
  final String status;

  const ProductStatusEntity({
    required this.id,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        status,
      ];
}
