import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';

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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: 10,
        child: Padding(
          padding: context.paddings.horizontalMedium,
          child: LinearProgressIndicator(
            minHeight: 10,
            borderRadius: BorderRadius.circular(20),
            value: widget.progressValue,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.electricViolet),
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
