import 'package:flutter/material.dart';
import 'package:flutter_donate_app/presentation/view/base_app/widgets/bottom_nav_items.dart';
import 'package:flutter_donate_app/presentation/viewmodel/base_app/base_app_viewmodel.dart';

class BaseAppViewModelImp extends ChangeNotifier implements BaseAppViewModel {
  final List<NavigationDestination> _views = BottomNavItems.views;

  int _selectedIndex = 0;

  @override
  List<NavigationDestination> get views => _views;

  @override
  int get selectedIndex => _selectedIndex;

  @override
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
  @override
  void reset() {
    _selectedIndex = 0;
  }

  @override
  bool get isSeenFabButton => _selectedIndex == 0;
}
