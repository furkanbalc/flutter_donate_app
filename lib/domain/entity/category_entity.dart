import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final List<CategoryEntity>? categories;

  const CategoriesEntity({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class CategoryEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
