import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/view/user_info/widgets/custom_linear_progress_bar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';

class UserInfoSliverAppBar extends StatelessWidget {
  const UserInfoSliverAppBar({super.key, required this.userInfoViewModel});

  final UserInfoViewModel userInfoViewModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.cascadingWhite,
      pinned: true,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(context.dynamicHeight(.075)),
        child: CustomLinearProgressBar(userInfoViewModel: userInfoViewModel),
      ),
    );
  }
}
