import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/custom_linear_progress_bar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';

class PersonalInfoSliverAppBar extends StatelessWidget {
  const PersonalInfoSliverAppBar({super.key, required this.personalInfoViewModel});

  final PersonalInfoViewModel personalInfoViewModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.whiteColor,
      pinned: true,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(context.dynamicHeight(.075)),
        child: CustomLinearProgressBar(personalInfoViewModel: personalInfoViewModel),
      ),
    );
  }
}
