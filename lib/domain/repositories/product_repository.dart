import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_status_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_type_entity.dart';

abstract class ProductRepository {
  /// -- GET CATEGORIES --
  Future<CategoriesEntity> getCategories();

  /// -- GET PRODUCTS --
  Future<ProductsEntity> getProducts();

  /// -- GET STATUSS --
  Future<ProductStatussEntity> getStatuss();

  /// -- GET TYPES --
  Future<ProductTypesEntity> getTypes();
}
