import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/domain/entity/category_entity.dart';
import 'package:flutter_donate_app/domain/repositories/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  @override
  Future<CategoriesEntity> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
