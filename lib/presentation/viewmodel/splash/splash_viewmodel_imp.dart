import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/data/models/on_board_model.dart';
import 'package:flutter_donate_app/domain/usecases/splash_usecase.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';

class SplashViewModelImp extends ChangeNotifier implements SplashViewModel {
  ApiResponse<bool> _getInitialScreenResponse = ApiResponse.loading('loading');
  ApiResponse<String?> _isLoggedInResponse = ApiResponse.loading('loading');
  ApiResponse<void> _setInitialScreenResponse = ApiResponse.loading('loading');
  final PageController _pageController = PageController(initialPage: 0);
  final List<OnBoardingModel> _pages = OnBoardingItems().onBoarditems;
  int _currentPage = 0;

  @override
  bool get isLastPage => _lastIndex == currentPage;

  @override
  bool get isFirstPage => currentPage == 0;

  int get _nextIndex => currentPage == _pages.length ? _pages.length - 1 : currentPage + 1;

  int get _prevIndex => currentPage == 0 ? 0 : currentPage - 1;

  int get _lastIndex => _pages.length - 1;

  @override
  ApiResponse<bool> get getInitialScreenResponse => _getInitialScreenResponse;

  @override
  ApiResponse<String?> get isLoggedInResponse => _isLoggedInResponse;

  @override
  ApiResponse<void> get setInitialScreenResponse => _setInitialScreenResponse;

  @override
  PageController get pageController => _pageController;

  @override
  List<OnBoardingModel> get pages => _pages;

  @override
  int get currentPage => _currentPage;

  @override
  set getInitialScreenResponse(ApiResponse<bool> value) {
    _getInitialScreenResponse = value;
    notifyListeners();
  }

  @override
  set isLoggedInResponse(ApiResponse<String?> value) {
    _isLoggedInResponse = value;
    notifyListeners();
  }

  @override
  set setInitialScreenResponse(ApiResponse<void> value) {
    _setInitialScreenResponse = value;
    notifyListeners();
  }

  /// -- SPLASH --
  ///
  /// -- IS USER LOGGED IN --
  @override
  Future<void> isLoggedIn() async {
    try {
      String? currentUserId = await injector<IsLoggedIn>().execute(ParamsForAny());
      isLoggedInResponse = ApiResponse.completed(currentUserId);
    } catch (e, stackTrace) {
      isLoggedInResponse = ApiResponse.error(e, stackTrace);
    }
  }

  @override
  Future<void> getInitialScreen() async {
    try {
      bool? initialScreen = await injector<GetInitialScreen>().execute(ParamsForAny());
      getInitialScreenResponse = ApiResponse.completed(initialScreen ?? false);
    } catch (e, stackTrace) {
      getInitialScreenResponse = ApiResponse.error(e, stackTrace);
    }
  }

  @override
  Future<void> setInitialScreen() async {
    try {
      await injector<SetInitialScreen>().execute(ParamsForAny());
      setInitialScreenResponse = ApiResponse.completed(true);
    } catch (e, stackTrace) {
      setInitialScreenResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- ON BOARD --
  @override
  void onPageChanged(int pageNumber) {
    _currentPage = pageNumber;
    notifyListeners();
  }

  void _animateToPage(int pageNumber) {
    pageController.animateToPage(
      pageNumber,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void animateToNextPage() => _animateToPage(_nextIndex);

  @override
  void animateToPrevPage() => _animateToPage(_prevIndex);

  @override
  void animateToLastPage() => _animateToPage(_lastIndex);
}
