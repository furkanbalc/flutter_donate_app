import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';

class UserInfoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double progressValue;
  final VoidCallback onBack;

  const UserInfoAppBar({
    super.key,
    required this.progressValue,
    required this.onBack,
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
      title: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.onBack,
            ),
            Expanded(
              child: Padding(
                padding: context.paddings.horizontalMedium,
                child: LinearProgressIndicator(
                  value: widget.progressValue,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.electricViolet),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            Text(
              '${(widget.progressValue * 3).round()}/3',
              style: context.textStyles.titleSmall,
            ),
            const SizedBox(width: 16.0), // Progress değeri ile geri butonu arasındaki boşluk
          ],
        ),
      ),
    );
  }
}
