import 'package:flutter/foundation.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/di/injection.dart';
import 'package:flutter_donate_app/domain/entities/product/category_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_status_entity.dart';
import 'package:flutter_donate_app/domain/entities/product/product_type_entity.dart';
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

  ///  -- GET PRODUCTS --
  ApiResponse<ProductsEntity> _getProductsResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<ProductsEntity> get getProductsResponse => _getProductsResponse;

  @override
  set getProductsResponse(ApiResponse<ProductsEntity> value) {
    _getProductsResponse = value;
    notifyListeners();
  }

  ///

  @override
  Future<void> getProducts() async {
    getProductsResponse = ApiResponse.loading("loading");
    try {
      final ProductsEntity productsEntity = await injector<GetProducts>().execute(
        const ParamsBase(),
      );
      getProductsResponse = ApiResponse.completed(productsEntity);
    } catch (e, stackTrace) {
      getProductsResponse = ApiResponse.error(e, stackTrace);
    }
  }

  ///  -- GET STATUSS --
  ApiResponse<ProductStatussEntity> _getProductStatussResponse = ApiResponse.initial('initial');

  ApiResponse<ProductStatussEntity> get getProductStatussResponse => _getProductStatussResponse;

  set getProductStatussResponse(ApiResponse<ProductStatussEntity> value) {
    _getProductStatussResponse = value;
    notifyListeners();
  }

  ///
  @override
  Future<void> getStatuss() async {
    getProductStatussResponse = ApiResponse.loading("loading");
    try {
      final ProductStatussEntity productStatussEntity = await injector<GetProductStatuss>().execute(
        const ParamsBase(),
      );
      getProductStatussResponse = ApiResponse.completed(productStatussEntity);
    } catch (e, stackTrace) {
      getProductStatussResponse = ApiResponse.error(e, stackTrace);
    }
  }

  ///  -- GET TYPES --
  ApiResponse<ProductTypesEntity> _getProductTypesResponse = ApiResponse.initial('initial');

  ApiResponse<ProductTypesEntity> get getProductTypesResponse => _getProductTypesResponse;

  set getProductTypesResponse(ApiResponse<ProductTypesEntity> value) {
    _getProductTypesResponse = value;
    notifyListeners();
  }

  ///
  @override
  Future<void> getTypes() async {
    getProductTypesResponse = ApiResponse.loading("loading");
    try {
      final ProductTypesEntity productTypesEntity = await injector<GetProductTypes>().execute(
        const ParamsBase(),
      );
      getProductTypesResponse = ApiResponse.completed(productTypesEntity);
    } catch (e, stackTrace) {
      getProductTypesResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- GET PRODUCT STATUS BY ID --
  @override
  String getProductStatusById({required String id}) {
    return _getProductStatussResponse.data.status!.firstWhere((element) => element.id == id).status;
  }

  /// -- GET PRODUCT TYPE BY ID --
  @override
  String getProductTypeById({required String id}) {
    return _getProductTypesResponse.data.types!.firstWhere((element) => element.id == id).type;
  }

  /// -- GET CATEGORY TYPE BY ID --
  @override
  String getProductCategoryById({required String id}) {
    return _getCategoriesResponse.data.categories!.firstWhere((element) => element.id == id).name!;
  }
}
