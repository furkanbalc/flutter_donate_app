import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';

class CustomDotPageSelector extends StatefulWidget {
  const CustomDotPageSelector({
    super.key,
    required this.selectedIndex,
    required this.tabLenght,
    this.indicatorSize,
  });
  final int selectedIndex;
  final int tabLenght;
  final double? indicatorSize;

  @override
  State<CustomDotPageSelector> createState() => _CustomDotPageSelectorState();
}

class _CustomDotPageSelectorState extends State<CustomDotPageSelector> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabLenght, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomDotPageSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  late final TabController _tabController;
  final double _defaultIndicatorSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
      indicatorSize: widget.indicatorSize ?? _defaultIndicatorSize,
      color: AppColors.greyLighter,
      selectedColor: AppColors.electricViolet,
      borderStyle: BorderStyle.none,
    );
  }
}
