import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/product/categories_model.dart';
import 'package:flutter_donate_app/data/models/product/product_model.dart';
import 'package:flutter_donate_app/data/models/product/product_status_model.dart';
import 'package:flutter_donate_app/data/models/product/product_type_model.dart';
import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_status_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_type_entity.dart';
import 'package:flutter_donate_app/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  /// -- GET CATEGORIES --
  @override
  Future<CategoriesEntity> getCategories() async {
    CategoriesModel categoriesModel = await remoteDataSource.getCategories();
    return categoriesModel.convertToEntity();
  }

  /// -- GET PRODUCTS --
  @override
  Future<ProductsEntity> getProducts() async {
    ProductsModel productsModel = await remoteDataSource.getProducts();
    return productsModel.convertToEntity();
  }
  /// -- GET STATUSS --
  @override
  Future<ProductStatussEntity> getStatuss() async {
    ProductStatussModel productStatussModel = await remoteDataSource.getStatuss();
    return productStatussModel.convertToEntity();
  }
  /// -- GET TYPES --
  @override
  Future<ProductTypesEntity> getTypes() async {
    ProductTypesModel productTypesModel = await remoteDataSource.getTypes();
    return productTypesModel.convertToEntity();
  }
}
