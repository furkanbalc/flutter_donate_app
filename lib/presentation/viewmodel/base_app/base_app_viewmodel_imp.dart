import 'package:flutter/material.dart';
import 'package:flutter_donate_app/presentation/view/base_app/widgets/bottom_nav_items.dart';
import 'package:flutter_donate_app/presentation/view/home/home.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile.dart';
import 'package:flutter_donate_app/presentation/viewmodel/base_app/base_app_viewmodel.dart';

class BaseAppViewModelImp extends ChangeNotifier implements BaseAppViewModel {
  final List<NavigationDestination> _views = BottomNavItems.views;

  int _selectedIndex = 0;

  @override
  List<NavigationDestination> get views => _views;

  @override
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  @override
  void onDestinationSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const Center(child: Text('3'));
      case 2:
        return const Center(child: Text('4'));
      case 3:
        return const ProfileView();
      default:
        return const Center(child: Text('Home'));
    }
  }

  @override
  void reset() {
    _selectedIndex = 0;
  }

  @override
  bool get isSeenFabButton => _selectedIndex == 0;
}
