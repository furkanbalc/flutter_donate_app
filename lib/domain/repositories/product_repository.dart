import 'package:flutter_donate_app/domain/entity/category_entity.dart';

abstract class ProductRepository {
  Future<CategoriesEntity> getCategories();
}