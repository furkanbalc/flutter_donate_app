import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.badge,
    this.imagePath,
    this.padding,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool? badge;
  final String? imagePath;
  final EdgeInsetsGeometry? padding;

  /// URL mi yoksa yerel bir dosya yolu mu olduğunu kontrol eder. URL ise true değilse false döner.
  bool get isUrl => imagePath != null && Uri.tryParse(imagePath!)?.hasAbsolutePath == true;

  @override
  Widget build(BuildContext context) {
    final double imageSize = height ?? 150;
    final bool showBadge = badge ?? true;

    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      child: showBadge
          ? Badge(
              offset: const Offset(-15, 120),
              label: const Icon(AppIcons.kEditPhotoIcon, color: Colors.white, size: 20),
              largeSize: 30,
              padding: context.paddings.allMin,
              backgroundColor: AppColors.electricViolet,
              child: buildProfileImage(context, imageSize),
            )
          : buildProfileImage(context, imageSize),
    );
  }
  /// Build photo widget
  Widget buildProfileImage(BuildContext context, double imageSize) {
    return Container(
      height: imageSize,
      width: imageSize,
      margin: context.paddings.allLow,
      padding: padding ?? context.paddings.allCustom,
      decoration: BoxDecoration(
        color: AppColors.cascadingWhite,
        shape: BoxShape.circle,
        image: imagePath == null
            ? null
            : DecorationImage(
                image: isUrl ? NetworkImage(imagePath!) : FileImage(File(imagePath!)) as ImageProvider,
                fit: BoxFit.cover,
              ),
      ),
      child: imagePath == null
          ? CustomSvgWidget(
              svg: AppAssets.profile.toSvg,
              width: width ?? context.dynamicWidth(.20),
            )
          : context.sizedBoxShrink,
    );
  }
}
