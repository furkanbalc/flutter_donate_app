import 'package:flutter/material.dart';

abstract class BaseAppViewModel extends ChangeNotifier {
  List<NavigationDestination> get views;

  int get selectedIndex;

  void onDestinationSelected(int index);

  Widget body();

  bool get isSeenFabButton;
}
