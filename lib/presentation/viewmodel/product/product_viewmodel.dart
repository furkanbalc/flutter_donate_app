import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';

abstract class ProductViewModel extends ChangeNotifier {
  ///  -- GET CATEGORIES --
  ApiResponse<CategoriesEntity> get getCategoriesResponse;

  set getCategoriesResponse(ApiResponse<CategoriesEntity> value);

  Future<void> getCategories();

  ///  -- GET PRODUCTS --
  ApiResponse<ProductsEntity> get getProductsResponse;

  set getProductsResponse(ApiResponse<ProductsEntity> value);

  Future<void> getProducts();

  Future<void> getStatuss();

  Future<void> getTypes();

  /// -- GET PRODUCT STATUS BY ID --
  String getProductStatusById({required String id});

  /// -- GET PRODUCT TYPE BY ID --
  String getProductTypeById({required String id});

  /// -- GET CATEGORY TYPE BY ID --
  String getProductCategoryById({required String id});
}
