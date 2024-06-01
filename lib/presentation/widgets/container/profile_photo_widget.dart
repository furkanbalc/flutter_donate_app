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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      child: badge ?? false
          ? Badge(
              offset: const Offset(-15, 120),
              label: const Icon(AppIcons.kEditPhotoIcon, color: Colors.white, size: 20),
              largeSize: 30,
              padding: const EdgeInsets.all(5),
              backgroundColor: AppColors.electricViolet,
              child: Container(
                height: height ?? 150,
                width: width ?? 150,
                margin: context.paddings.allLow,
                padding: padding ?? context.paddings.allCustom,
                decoration: BoxDecoration(
                  color: AppColors.cascadingWhite,
                  shape: BoxShape.circle,
                  image:
                      imagePath == null ? null : DecorationImage(image: FileImage(File(imagePath!)), fit: BoxFit.cover),
                ),
                child: imagePath == null
                    ? CustomSvgWidget(
                        svg: AppAssets.profile.toSvg,
                        width: width ?? context.dynamicWidth(.20),
                      )
                    : context.sizedBoxShrink,
              ),
            )
          : Container(
              height: height ?? 150,
              width: width ?? 150,
              margin: context.paddings.allLow,
              padding: padding ?? context.paddings.allCustom,
              decoration: BoxDecoration(
                color: AppColors.cascadingWhite,
                shape: BoxShape.circle,
                image:
                    imagePath == null ? null : DecorationImage(image: FileImage(File(imagePath!)), fit: BoxFit.cover),
              ),
              child: imagePath == null
                  ? CustomSvgWidget(
                      svg: AppAssets.profile.toSvg,
                      width: width ?? context.dynamicWidth(.20),
                    )
                  : context.sizedBoxShrink,
            ),
    );
  }
}
