import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/bottom_bar_items.dart';

class BottomNavItems {
    static final List<NavigationDestination> views = [
    NavigationDestination(
      icon:
      // selectedIndex == BottomBarItems.home.index
      //     ? const Icon(AppIcons.kHomeFilledIcon)
      //     :
      const Icon(AppIcons.kHomeOutlinedIcon),
      label: BottomBarItems.home.value,
    ),
    NavigationDestination(
      icon:
      // selectedIndex == BottomBarItems.product.index
      //     ? const Icon(AppIcons.kGiftFilledIcon)
      //     :
      const Icon(AppIcons.kGiftOutlinedIcon),
      label: BottomBarItems.product.value,
    ),
    NavigationDestination(
      icon:
      // selectedIndex == BottomBarItems.message.index
      //     ? const Icon(AppIcons.kMessageFilledIcon)
      //     :
      const Icon(AppIcons.kMessageOutlinedIcon),
      label: BottomBarItems.message.value,
    ),
    NavigationDestination(
      icon:
      // selectedIndex == BottomBarItems.profile.index
      //     ? const Icon(AppIcons.kUserFilledIcon)
      //     :
      const Icon(AppIcons.kUserOutlinedIcon),
      label: BottomBarItems.profile.value,
    ),
  ];
}