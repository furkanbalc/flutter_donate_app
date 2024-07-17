import 'package:flutter/foundation.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/di/injection.dart';
import 'package:flutter_donate_app/domain/entity/category_entity.dart';
import 'package:flutter_donate_app/domain/usecases/product_usecase.dart';
import 'package:flutter_donate_app/presentation/viewmodel/product/product_viewmodel.dart';

class ProductViewModelImp extends ChangeNotifier implements ProductViewModel {
  ///  -- GET CATEGORIES --
  ApiResponse<CategoriesEntity> _getCategoriesResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<CategoriesEntity> get getCategoriesResponse => _getCategoriesResponse;

  @override
  set getCategoriesResponse(ApiResponse<CategoriesEntity> value) {
    _getCategoriesResponse = value;
    notifyListeners();
  }

  ///

  @override
  Future<void> getCategories() async {
    getCategoriesResponse = ApiResponse.loading("loading");
    try {
      final CategoriesEntity categoryEntity = await injector<GetCategories>().execute(
        const ParamsBase(),
      );

      getCategoriesResponse = ApiResponse.completed(categoryEntity);
    } catch (e, stackTrace) {
      getCategoriesResponse = ApiResponse.error(e, stackTrace);
    }
  }
}
