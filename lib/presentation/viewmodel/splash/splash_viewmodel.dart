import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/data/models/on_board_model.dart';

abstract class SplashViewModel with ChangeNotifier {
  ApiResponse<bool> get getInitialScreenResponse;

  ApiResponse<void> get setInitialScreenResponse;

  PageController get pageController;

  List<OnBoardingModel> get pages;

  int get currentPage;

  bool get isFirstPage;

  bool get isLastPage;

  void animateToNextPage();

  void animateToPrevPage();

  void animateToLastPage();

  set getInitialScreenResponse(ApiResponse<bool> value);

  set setInitialScreenResponse(ApiResponse<void> value);

  Future<void> getInitialScreen();

  Future<void> setInitialScreen();

  void onPageChanged(int pageNumber);
}
