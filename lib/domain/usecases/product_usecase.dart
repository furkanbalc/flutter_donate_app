import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_status_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_type_entity.dart';
import 'package:flutter_donate_app/domain/repositories/product_repository.dart';

class ParamsBase {
  const ParamsBase();
}

/// -- GET CATEGORIES --
class GetCategories extends BaseUseCase<Future<CategoriesEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetCategories({required this.productRepository});

  @override
  Future<CategoriesEntity> execute(ParamsBase params) async {
    return await productRepository.getCategories();
  }
}

/// -- GET PRODUCTS --
class GetProducts extends BaseUseCase<Future<ProductsEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetProducts({required this.productRepository});

  @override
  Future<ProductsEntity> execute(ParamsBase params) async {
    return await productRepository.getProducts();
  }
}

/// -- GET STATUS --
class GetProductStatuss extends BaseUseCase<Future<ProductStatussEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetProductStatuss({required this.productRepository});

  @override
  Future<ProductStatussEntity> execute(ParamsBase params) async {
    return await productRepository.getStatuss();
  }
}

/// -- GET TYPES --
class GetProductTypes extends BaseUseCase<Future<ProductTypesEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetProductTypes({required this.productRepository});

  @override
  Future<ProductTypesEntity> execute(ParamsBase params) async {
    return await productRepository.getTypes();
  }
}
