import 'package:flutter/material.dart';

abstract class BaseAppViewModel extends ChangeNotifier {
  List<NavigationDestination> get views;

  int get selectedIndex;

  set selectedIndex(int index);

  void reset();

  bool get isSeenFabButton;
}
