import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/category_entity.dart';

abstract class ProductViewModel extends ChangeNotifier {
  ///  -- GET CATEGORIES --
  ApiResponse<CategoriesEntity> get getCategoriesResponse;

  set getCategoriesResponse(ApiResponse<CategoriesEntity> value);

  Future<void> getCategories();
}
