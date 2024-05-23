import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';

class UserInfoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double progressValue;

  const UserInfoAppBar({
    super.key,
    required this.progressValue,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<UserInfoAppBar> createState() => _UserInfoAppBarState();
}

class _UserInfoAppBarState extends State<UserInfoAppBar> {
  double _currentProgress = 0;

  @override
  void didUpdateWidget(UserInfoAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressValue != widget.progressValue) {
      _animateProgress(oldWidget.progressValue, widget.progressValue);
    }
  }

  void _animateProgress(double oldValue, double newValue) {
    setState(() {
      _currentProgress = oldValue;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        _currentProgress = newValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: 10,
        width: context.dynamicWidth(.7),
        child: Padding(
          padding: context.paddings.horizontalMedium,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: _currentProgress, end: widget.progressValue),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                minHeight: 10,
                borderRadius: BorderRadius.circular(20),
                value: value,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.electricViolet),
                backgroundColor: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}
