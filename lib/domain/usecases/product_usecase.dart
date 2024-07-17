import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/domain/entity/category_entity.dart';
import 'package:flutter_donate_app/domain/repositories/product_repository.dart';

/// -- GET CATEGORIES --
class ParamsBase {
  const ParamsBase();
}

class GetCategories extends BaseUseCase<Future<CategoriesEntity>, ParamsBase> {
  final ProductRepository productRepository;

  GetCategories({required this.productRepository});

  @override
  Future<CategoriesEntity> execute(ParamsBase params) async {
    return await productRepository.getCategories();
  }
}
